const express = require('express');
const router = express.Router();
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });  // Configure multer for handling file uploads
const {
  getAllEmployees,
  getEmployeeById,
  createEmployee,
  updateEmployee,
  deleteEmployee,
  toggleEmployeeStatus
} = require('../controllers/employeeController');

// Route definitions
router.get('/get-employee', getAllEmployees);
router.get('/get-employee/:id', getEmployeeById);
router.post('/create-employee', upload.single('image'), createEmployee);  // Single file upload for image
router.put('/update-employee/:id', updateEmployee);
router.delete('/delete-employee/:id', deleteEmployee);
router.patch('/:id/toggle-status', toggleEmployeeStatus);  // Endpoint to toggle status

module.exports = router;
