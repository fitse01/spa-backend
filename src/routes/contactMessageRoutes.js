const express = require('express');
const {
  createContactMessage,
  getAllContactMessages,
  getContactMessageById,
  updateContactMessage,
  deleteContactMessage,
  searchContactMessages,
} = require('../controllers/contactMessageController');

const router = express.Router();

router.post('/create-message', createContactMessage);
router.get('/get-message', getAllContactMessages);
router.get('/get-message/:id', getContactMessageById);
router.put('/update-message/:id', updateContactMessage);
router.delete('/delete-message/:id', deleteContactMessage);
router.get('/search', searchContactMessages);

module.exports = router;
