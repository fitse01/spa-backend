const prisma = require('../config/prismaClient');

// Create FAQ

const createFAQ = async (req, res) => {
    try {
        const { question, answer, category, order } = req.body;
        const faq = await prisma.fAQ.create({
            data: { question, answer, category, order },
        });
        res.status(201).json(faq);
    } catch (error) {
        console.error("Error creating FAQ:", error); // Log the error to see the details
        res.status(500).json({ error: 'Failed to create FAQ', details: error.message });
    }
};

// Get All FAQs
const getAllFAQs = async (req, res) => {
    try {
        const faqs = await prisma.fAQ.findMany();
        res.json(faqs);
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch FAQs' });
    }
};

// Get FAQ by ID
const getFAQById = async (req, res) => {
    try {
        const { id } = req.params;
        const faq = await prisma.fAQ.findUnique({ where: { id: parseInt(id) } });
        faq ? res.json(faq) : res.status(404).json({ error: 'FAQ not found' });
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch FAQ' });
    }
};

// Update FAQ
const updateFAQ = async (req, res) => {
    try {
        const { id } = req.params;
        const { question, answer, category, order, status } = req.body;
        const faq = await prisma.fAQ.update({
            where: { id: parseInt(id) },
            data: { question, answer, category, order, status },
        });
        res.json(faq);
    } catch (error) {
        res.status(500).json({ error: 'Failed to update FAQ' });
    }
};

// Delete FAQ
const deleteFAQ = async (req, res) => {
    try {
        const { id } = req.params;
        await prisma.fAQ.delete({ where: { id: parseInt(id) } });
        res.status(201).json({ msg: ' delete FAQ successfull' });
    } catch (error) {
        res.status(500).json({ error: 'Failed to delete FAQ' });
    }
};

// Search FAQs
const searchFAQs = async (req, res) => {
    try {
        const { query } = req.query;
        const faqs = await prisma.fAQ.findMany({
            where: { question: { contains: query, mode: 'insensitive' } },
        });
        res.json(faqs);
    } catch (error) {
        res.status(500).json({ error: 'Failed to search FAQs' });
    }
};



module.exports = {
    createFAQ,
    getAllFAQs,
    getFAQById,
    updateFAQ,
    deleteFAQ,
    searchFAQs
  };