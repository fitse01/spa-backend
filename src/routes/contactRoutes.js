// src/routes/contactRoutes.js
const express = require("express");
const router = express.Router();
const {
  createContact,
  getAllContacts,
  getContactById,
  updateContact,
  deleteContact,
} = require("../controllers/contactController");

router.post("/create-contact", createContact);            // Create new contact information
router.get("/get-contact", getAllContacts);            // Get all contact information
router.get("/get-contact/:id", getContactById);         // Get contact by ID
router.put("/update-contact/:id", updateContact);          // Update contact information by ID
router.delete("/delete-contact/:id", deleteContact);       // Delete contact by ID

module.exports = router;
