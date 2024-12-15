const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
const cloudinary = require('../config/cloudinary');
const fs = require('fs');

// Get all services
const getAllServices = async (req, res) => {
    try {
      const services = await prisma.service.findMany();
      res.json(services);
    } catch (error) {
      console.error("Error fetching services:", error); // Log error details
      res.status(500).json({ error: 'Error fetching services' });
    }
  };
  

// Get a specific service by ID
const getServiceById = async (req, res) => {
  const { id } = req.params;
  try {
    const service = await prisma.service.findUnique({ where: { id: parseInt(id) } });
    if (!service) return res.status(404).json({ error: 'Service not found' });
    res.json(service);
  } catch (error) {
    res.status(500).json({ error: 'Error fetching service' });
  }
};

// Create a new service
const createService = async (req, res) => {
    try {
        const { path } = req.file;  // Get the file path from multer
        const { title, tag, description, is_active } = req.body;

        // Upload image to Cloudinary
        const result = await cloudinary.uploader.upload(path);

        // Remove local file after uploading to Cloudinary
        fs.unlinkSync(path);

        // Save service to the database
        const service = await prisma.service.create({
            data: {
                title,
                tag,
                imageUrl: result.secure_url,
                description,
                isActive: is_active ?? true
            }
        });

        res.status(201).json(service);
    } catch (error) {
        console.error("Error creating service:", error);
        res.status(500).json({ error: error });
    }
};


// Update an existing service
const updateService = async (req, res) => {
  const { id } = req.params;
  const { title, tag, image_url, description } = req.body;
  try {
    const updatedService = await prisma.service.update({
      where: { id: parseInt(id) },
      data: { title, tag, imageUrl: image_url, description },
    });
    res.json(updatedService);
  } catch (error) {
    res.status(500).json({ error: 'Error updating service' });
  }
};

// Delete a service
const deleteService = async (req, res) => {
  const { id } = req.params;
  try {
    await prisma.service.delete({ where: { id: parseInt(id) } });
    res.json({ message: 'Service deleted' });
  } catch (error) {
    res.status(500).json({ error: 'Error deleting service' });
  }
};

// Toggle service availability (boolean on/off)
const toggleService = async (req, res) => {
  const { id } = req.params;
  try {
    const service = await prisma.service.findUnique({ where: { id: parseInt(id) } });
    if (!service) return res.status(404).json({ error: 'Service not found' });
    
    const updatedService = await prisma.service.update({
      where: { id: parseInt(id) },
      data: { isActive: !service.isActive }, // Toggle boolean
    });
    res.json(updatedService);
  } catch (error) {
    res.status(500).json({ error: 'Error toggling service status' });
  }
};

module.exports = {
  getAllServices,
  getServiceById,
  createService,
  updateService,
  deleteService,
  toggleService,
};
