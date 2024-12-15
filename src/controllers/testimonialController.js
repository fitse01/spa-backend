const prisma = require('../config/prismaClient');
const cloudinary = require('../config/cloudinary');
const fs = require('fs');

// Get all testimonials
const getAllTestimonials = async (req, res) => {
    try {
        const testimonials = await prisma.testimonial.findMany({
            orderBy: { priority: 'desc' },
        });
        res.json(testimonials);
    } catch (error) {
        console.error("Error fetching testimonials:", error);
        res.status(500).json({ error: 'Error fetching testimonials' });
    }
};

// Get a specific testimonial by ID
const getTestimonialById = async (req, res) => {
    const { id } = req.params;
    try {
        const testimonial = await prisma.testimonial.findUnique({ where: { id: parseInt(id) } });
        if (!testimonial) return res.status(404).json({ error: 'Testimonial not found' });
        res.json(testimonial);
    } catch (error) {
        console.error("Error fetching testimonial:", error);
        res.status(500).json({ error: 'Error fetching testimonial' });
    }
};

// Create a new testimonial
const createTestimonial = async (req, res) => {
    try {
        const { path } = req.file; // Get the file path from multer
        const { full_name, rating, message, status, priority } = req.body;

        // Debugging log
        // console.log(prisma); // Check if prisma is defined

        // Check if testimonial already exists
        const existingTestimonial = await prisma.testimonial.findFirst({
            where: { full_name, message }
        });

        if (existingTestimonial) {
            return res.status(400).json({ error: 'Testimonial already exists' });
        }

        // Upload image to Cloudinary
        const result = await cloudinary.uploader.upload(path);

        // Remove local file after uploading to Cloudinary
        fs.unlinkSync(path);

        // Save testimonial to the database
        const testimonial = await prisma.testimonial.create({
            data: {
                full_name,
                rating: parseInt(rating),
                message,
                image_url: result.secure_url,
                status: status ?? 'pending',
                priority: priority ? parseInt(priority) : null
            }
        });

        res.status(201).json(testimonial);
    } catch (error) {
        console.error("Error creating testimonial:", error);
        res.status(500).json({ error: "Error creating testimonial" });
    }
};

// Update an existing testimonial
const updateTestimonial = async (req, res) => {
    const { id } = req.params;
    const { full_name, rating, message, status, priority } = req.body;

    try {
        const testimonial = await prisma.testimonial.findUnique({ where: { id: parseInt(id) } });
        if (!testimonial) return res.status(404).json({ error: 'Testimonial not found' });

        // Check if a new image file is provided
        let image_url = testimonial.image_url; // Keep existing image URL by default

        if (req.file) {
            const result = await cloudinary.uploader.upload(req.file.path);
            fs.unlinkSync(req.file.path);
            image_url = result.secure_url; // Update to new image URL
        }

        const updatedTestimonial = await prisma.testimonial.update({
            where: { id: parseInt(id) },
            data: {
                full_name: full_name ?? testimonial.full_name,
                rating: rating !== undefined ? parseInt(rating) : testimonial.rating,
                message: message ?? testimonial.message,
                status: status ?? testimonial.status,
                priority: priority !== undefined ? parseInt(priority) : testimonial.priority,
                image_url // Use the new or existing image URL
            },
        });

        res.json(updatedTestimonial);
    } catch (error) {
        console.error("Error updating testimonial:", error);
        res.status(500).json({ error: 'Error updating testimonial' });
    }
};

// Delete a testimonial
const deleteTestimonial = async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.testimonial.delete({ where: { id: parseInt(id) } });
        res.json({ message: 'Testimonial deleted' });
    } catch (error) {
        console.error("Error deleting testimonial:", error);
        res.status(500).json({ error: 'Error deleting testimonial' });
    }
};

module.exports = {
    getAllTestimonials,
    getTestimonialById,
    createTestimonial,
    updateTestimonial,
    deleteTestimonial
};