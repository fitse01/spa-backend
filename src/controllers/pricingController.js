const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const cloudinary = require("../config/cloudinary");
const fs = require("fs");

// Create Pricing Entry
const createPricing = async (req, res) => {
  try {
    const { path } = req.file; // Get file path from multer
    const { title, description, price } = req.body;
    const existingPrice = await prisma.pricing.findFirst({
      where: { title },
    });

    if (existingPrice) {
      return res
        .status(400)
        .json({ error: "A Price with this title already exists" });
    }

    // Upload image to Cloudinary
    const result = await cloudinary.uploader.upload(path);

    // Remove local file after uploading to Cloudinary
    fs.unlinkSync(path);

    // Save pricing entry to the database
    const pricing = await prisma.pricing.create({
      data: {
        image: result.secure_url,
        title,
        description,
        price: parseFloat(price),
      },
    });

    res.status(201).json(pricing);
  } catch (error) {
    console.error("Error creating blog:", error);

    // Handle file cleanup if the upload or database fails
    if (req.file && fs.existsSync(req.file.path)) {
      fs.unlinkSync(req.file.path);
    }

    res.status(500).json({ error: "Error creating blog" });
  }
};

// Get All Pricing Entries
const getAllPricing = async (req, res) => {
  try {
    const pricing = await prisma.pricing.findMany();
    res.status(200).json(pricing);
  } catch (error) {
    console.log(error);
  }
};

// Get Pricing Entry by ID
const getPricingById = async (req, res) => {
  try {
    const { id } = req.params;
    const pricing = await prisma.pricing.findUnique({
      where: { id: parseInt(id) },
    });
    res.status(200).json(pricing);
  } catch (error) {
    console.log(error);
  }
};

// Update Pricing Entry
const updatePricing = async (req, res) => {
  try {
    const { id } = req.params;
    const updatedData = {};

    // Update image if a new file is uploaded
    if (req.file) {
      const { path } = req.file;
      const result = await cloudinary.uploader.upload(path);
      fs.unlinkSync(path); // Remove local file
      updatedData.image = result.secure_url;
    }

    // Update other fields if provided
    const { title, description, price } = req.body;
    if (title) updatedData.title = title;
    if (description) updatedData.description = description;
    if (price) updatedData.price = parseFloat(price);

    const pricing = await prisma.pricing.update({
      where: { id: parseInt(id) },
      data: updatedData,
    });

    res.status(200).json(pricing);
  } catch (error) {
    next(error);
  }
};

// Delete Pricing Entry
const deletePricing = async (req, res, next) => {
  try {
    const { id } = req.params;

    // Check if id is a valid number
    if (isNaN(id)) {
      return res.status(400).json({ msg: "Invalid ID format" });
    }

    // Attempt to delete the pricing entry
    const deletedPricing = await prisma.pricing.delete({
      where: { id: parseInt(id) },
    });

    // Send a success response with a message
    res
      .status(200)
      .json({ msg: "Delete price done successfully", data: deletedPricing });
  } catch (error) {
    // Pass the error to the next middleware
    next(error);
  }
};

module.exports = {
  createPricing,
  getAllPricing,
  getPricingById,
  updatePricing,
  deletePricing,
};
