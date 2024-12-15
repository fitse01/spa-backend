const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const cloudinary = require("../config/cloudinary");
const fs = require("fs");

// Get all blogs with search, filter, and pagination
const getAllBlogs = async (req, res) => {
  try {
    const { tag, author, status, title, page = 1, limit = 10 } = req.query;
    const filters = {
      deleted: false,
      ...(tag && { tag }),
      ...(author && { author }),
      ...(status && { status }),
      ...(title && { title: { contains: title, mode: "insensitive" } }),
    };

    const blogs = await prisma.blog.findMany({
      where: filters,
      skip: (page - 1) * limit,
      take: parseInt(limit),
    });

    res.status(200).json(blogs);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to fetch blogs" });
  }
};

// Get a single blog by ID
const getBlogById = async (req, res) => {
  try {
    const { id } = req.params;
    const blog = await prisma.blog.findUnique({
      where: { id: parseInt(id) },
    });

    if (!blog || blog.deleted) {
      return res.status(404).json({ error: "Blog not found" });
    }

    res.status(200).json(blog);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to fetch blog" });
  }
};

// Create a new blog
const createBlog = async (req, res) => {
    const { title, tag, description, author, status } = req.body;
  try {
    const { path } = req.file; // Get file path from multer

    // Check if a blog with the same title already exists
    const existingBlog = await prisma.blog.findFirst({
      where: { title },
    });

    if (existingBlog) {
      return res.status(400).json({ error: 'A blog with this title already exists' });
    }

    // Upload image to Cloudinary
    const result = await cloudinary.uploader.upload(path);


    // Remove local file after uploading to Cloudinary
    fs.unlinkSync(path);

    // Save blog to the database
    const blog = await prisma.blog.create({
      data: {
        image: result.secure_url,
        title,
        tag,
        description,
        author: author || "Rejuva Glow Beauty",
        status: status || 'DRAFT', // Default to DRAFT
        date: new Date(),
      },
    });

    res.status(201).json(blog);
  } catch (error) {
    console.error('Error creating blog:', error);

    // Handle file cleanup if the upload or database fails
    if (req.file && fs.existsSync(req.file.path)) {
      fs.unlinkSync(req.file.path);
    }

    res.status(500).json({ error: 'Error creating blog' });
  }
};


// Update a blog (partial or full)
const updateBlog = async (req, res) => {
  const { id } = req.params;

  try {
    const updatedData = {};

    // Update image if a new file is uploaded
    if (req.file) {
      const { path } = req.file;
      const result = await cloudinary.uploader.upload(path);
      fs.unlinkSync(path); // Remove local file
      updatedData.image = result.secure_url;
    }

    // Update other fields if provided
    const { title, tag, description, author, status } = req.body;
    if (title) updatedData.title = title;
    if (tag) updatedData.tag = tag;
    if (description) updatedData.description = description;
    if (author) updatedData.author = author;
    if (status) updatedData.status = status;

    const blog = await prisma.blog.update({
      where: { id: parseInt(id) },
      data: updatedData,
    });

    res.status(200).json(blog);
  } catch (error) {
    console.error("Error updating blog:", error);
    res.status(500).json({ error: "Error updating blog" });
  }
};

// Soft delete a blog
const deleteBlog = async (req, res) => {
  try {
    const { id } = req.params;

    const blog = await prisma.blog.update({
      where: { id: parseInt(id) },
      data: { deleted: true },
    });

    res.status(200).json({ message: "Blog soft-deleted successfully", blog });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to delete blog" });
  }
};

// Permanently delete a blog
const deleteBlogPermanently = async (req, res) => {
  try {
    const { id } = req.params;

    await prisma.blog.delete({
      where: { id: parseInt(id) },
    });

    res.status(200).json({ message: "Blog permanently deleted successfully" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to delete blog permanently" });
  }
};

// Toggle blog status between DRAFT and PUBLISHED
const toggleBlogStatus = async (req, res) => {
  try {
    const { id } = req.params;

    const blog = await prisma.blog.findUnique({ where: { id: parseInt(id) } });

    if (!blog || blog.deleted) {
      return res.status(404).json({ error: "Blog not found" });
    }

    const updatedBlog = await prisma.blog.update({
      where: { id: parseInt(id) },
      data: { status: blog.status === "DRAFT" ? "PUBLISHED" : "DRAFT" },
    });

    res
      .status(200)
      .json({ message: "Blog status toggled successfully", updatedBlog });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to toggle blog status" });
  }
};

module.exports = {
  getAllBlogs,
  getBlogById,
  createBlog,
  updateBlog,
  deleteBlog,
  deleteBlogPermanently,
  toggleBlogStatus,
};
