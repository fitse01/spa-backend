// const prisma = require('../config/prismaClient');
// import {prisma} from "../config/prismaClient"
// const PrismaClient = require("@prisma/client")
const {PrismaClient} = require("@prisma/client");
const prisma = new PrismaClient()
// Create a new contact message
const createContactMessage = async (req, res) => {
  console.log(req.body)
  
  try {
    const { message, fullname, email, phoneNo, subject } = req.body;
    // Check for existing contact message with the same email and message
    // const existingContactMessage = await prisma.contactMessage.findFirst({
    //   where: {
    //     email: email,
    //     message: message,
    //   }
    // });

    // if (existingContactMessage) {
    //   return res.status(409).json({ error: 'Contact message already exists for this email. Please insert another message.' });
    // }

    const contactMessage = await prisma.contactMessage.create({
      data: { message:"hello", fullname:fullname, email, phoneNo, subject },
    });
    res.status(201).json(contactMessage);
  } catch (error) {
    console.error(error); // Log the error for debugging
    res.status(500).json({ error: error });
  }
};

module.exports = { createContactMessage };
// Get all contact messages
const getAllContactMessages = async (_req, res) => {
  try {
    const contactMessages = await prisma.contactMessage.findMany();
    res.json(contactMessages);
  } catch (error) {
    res.status(500).json({ error: 'Error fetching contact messages' });
  }
};

// Get a contact message by ID
const getContactMessageById = async (req, res) => {
  try {
    const { id } = req.params;
    const contactMessage = await prisma.contactMessage.findUnique({
      where: { id: Number(id) },
    });
    if (contactMessage) res.json(contactMessage);
    else res.status(404).json({ error: 'Contact message not found' });
  } catch (error) {
    res.status(500).json({ error: 'Error fetching contact message' });
  }
};

// Update a contact message by ID
const updateContactMessage = async (req, res) => {
    const { id } = req.params;
    const { message, fullname, email, phoneNo, subject, status, response } = req.body;
  
    try {
      const updatedData = {};
  
      // Conditionally update fields if they are provided in the request body
      if (message) updatedData.message = message;
      if (fullname) updatedData.fullname = fullname;
      if (email) updatedData.email = email;
      if (phoneNo) updatedData.phoneNo = phoneNo;
      if (subject) updatedData.subject = subject;
      if (status) updatedData.status = status;
      if (response) {
        updatedData.response = response;
        updatedData.respondedAt = new Date(); // Set respondedAt if response is provided
      }
  
      const contactMessage = await prisma.contactMessage.update({
        where: { id: Number(id) },
        data: updatedData,
      });
  
      res.json(contactMessage);
    } catch (error) {
      console.error(error); // Log error for debugging
      res.status(500).json({ error: 'Error updating contact message' });
    }
  };
  
  module.exports = { updateContactMessage };

// Delete a contact message by ID
const deleteContactMessage = async (req, res) => {
  try {
    const { id } = req.params;
    await prisma.contactMessage.delete({ where: { id: Number(id) } });
    res.status(200).json({msg:'message deleted succesfully .'} );
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

// Search contact messages by subject or fullname
const searchContactMessages = async (req, res) => {
    try {
      const { query } = req.query;
      
      // Convert query to lowercase for case-insensitive search
      const lowerCaseQuery = query.toLowerCase();
  
      const contactMessages = await prisma.contactMessage.findMany({
        where: {
          OR: [
            {
              subject: {
                contains: lowerCaseQuery,
                // No mode option needed
              }
            },
            {
              fullname: {
                contains: lowerCaseQuery,
                // No mode option needed
              }
            }
          ]
        }
      });
  
      res.json(contactMessages);
    } catch (error) {
      console.error(error); // Log the error for debugging
      res.status(500).json({ error: 'Error searching contact messages' });
    }
  };

module.exports = {
  createContactMessage,
  getAllContactMessages,
  getContactMessageById,
  updateContactMessage,
  deleteContactMessage,
  searchContactMessages,
};
