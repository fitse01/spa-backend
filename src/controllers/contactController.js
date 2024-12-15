// src/controllers/contactController.js
const prisma = require('../config/prismaClient')


// Create Contact
exports.createContact = async (req, res) => {
    try {
      const { email, location, phone, workingDays, facebookUrl, instagramUrl, website, emergencyContact } = req.body;
      
      const contact = await prisma.contact.create({
        data: {
          email,
          location,
          phone,
          workingDays,
          facebookUrl,
          instagramUrl,
          website,
          emergencyContact
        }
      });
      res.status(201).json(contact);
    } catch (error) {
      res.status(500).json({ error: 'Error creating contact' });
    }
  };


exports.getAllContacts = async (req, res) => {
  try {
    const contacts = await prisma.contact.findMany();
    res.status(200).json(contacts);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.getContactById = async (req, res) => {
  try {
    const { id } = req.params;
    const contact = await prisma.contact.findUnique({ where: { id: parseInt(id) } });
    if (!contact) return res.status(404).json({ error: "Contact not found" });
    res.status(200).json(contact);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.updateContact = async (req, res) => {
  try {
    const { id } = req.params;
    const { email, location, phone, workingDays, facebookUrl, instagramUrl, website, emergencyContact } = req.body;
    const contact = await prisma.contact.update({
      where: { id: parseInt(id) },
      data: { email, location, phone, workingDays, facebookUrl, instagramUrl, website, emergencyContact },
    });
    res.status(200).json(contact);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

exports.deleteContact = async (req, res) => {
    try {
      const { id } = req.params;
      await prisma.contact.delete({ where: { id: parseInt(id) } });
      res.status(204).send();
    } catch (error) {
      // Check if the error is a Prisma error related to record not found
      if (error.code === 'P2025') {
        // P2025 is the error code for "Record to delete does not exist."
        res.status(404).json({ error: 'Record to delete does not exist.' });
      } else {
        res.status(500).json({ error: 'An error occurred while deleting the contact.' });
      }
    }
  };
