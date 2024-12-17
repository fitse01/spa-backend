const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const cloudinary = require("../config/cloudinary");
const fs = require("fs");

// GET all products with pagination
const getAllProducts = async (req, res) => {
  const { page = 1, limit = 10 } = req.query;
  const skip = (page - 1) * limit;

  try {
    const products = await prisma.product.findMany({
      skip: parseInt(skip),
      take: parseInt(limit),
    });

    res.json(products);
  } catch (error) {
    console.error("Error fetching products:", error);
    res.status(500).json({ error: "Error fetching products" });
  }
};

// GET a product by ID
const getProductById = async (req, res) => {
  const { id } = req.params;
  try {
    const product = await prisma.product.findUnique({
      where: { id: parseInt(id) },
    });
    if (!product) return res.status(404).json({ error: "Product not found" });
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: "Error fetching product" });
  }
};

// POST create a new product
// POST create a new product
const createProduct = async (req, res) => {
  try {
    const {
      name,
      description,
      price,
      quantity,
      stockStatus,
      discount,
      category,
    } = req.body;
    const files = req.files;

    // Check if the product with the same name and category already exists
    const existingProduct = await prisma.product.findFirst({
      where: {
        name,
        category,
      },
    });

    if (existingProduct) {
      return res.status(400).json({
        error: `A product with the name "${name}" already exists in the "${category}" category. Please change the category or name.`,
      });
    }

    // Upload multiple images to Cloudinary
    const imageUploads = await Promise.all(
      files.map((file) => cloudinary.uploader.upload(file.path))
    );

    // Get URLs and clean up local files
    const imageUrls = imageUploads.map((result) => result.secure_url);
    files.forEach((file) => fs.unlinkSync(file.path));

    // Save product to the database
    const product = await prisma.product.create({
      data: {
        name,
        description,
        price: parseFloat(price),
        quantity: parseInt(quantity),
        stockStatus: stockStatus || "In Stock",
        discount: parseFloat(discount) || 0.0,
        images: imageUrls,
        category,
      },
    });

    res.status(201).json(product);
  } catch (error) {
    console.error("Error creating product:", error);
    res.status(500).json({ error: "Error creating product" });
  }
};



// PUT update product by ID
const updateProduct = async (req, res) => {
  const { id } = req.params;

  try {
    const updatedData = {};

    // Update images if new files are uploaded
    if (req.files && req.files.length > 0) {
      const imageUploads = await Promise.all(
        req.files.map((file) => cloudinary.uploader.upload(file.path))
      );
      updatedData.images = imageUploads.map((result) => result.secure_url);

      // Remove local files
      req.files.forEach((file) => fs.unlinkSync(file.path));
    }

    // Update other fields if provided
    const {
      name,
      description,
      price,
      quantity,
      stockStatus,
      discount,
      category,
    } = req.body;
    if (name) updatedData.name = name;
    if (description) updatedData.description = description;
    if (price) updatedData.price = parseFloat(price);
    if (quantity) updatedData.quantity = parseInt(quantity);
    if (stockStatus) updatedData.stockStatus = stockStatus;
    if (discount) updatedData.discount = parseFloat(discount);
    if (category) updatedData.category = category;

    // Update product in the database
    const updatedProduct = await prisma.product.update({
      where: { id: parseInt(id) },
      data: updatedData,
    });

    res.status(200).json(updatedProduct);
  } catch (error) {
    console.error("Error updating product:", error);
    res.status(500).json({ error: "Error updating product" });
  }
};

// DELETE product by ID
const deleteProduct = async (req, res) => {
  const { id } = req.params;
  try {
    await prisma.product.delete({ where: { id: parseInt(id) } });
    res.json({ message: "Product deleted successfully" });
  } catch (error) {
    res.status(500).json({ error: "Error deleting product" });
  }
};

module.exports = {
  getAllProducts,
  getProductById,
  createProduct,
  updateProduct,
  deleteProduct,
};
