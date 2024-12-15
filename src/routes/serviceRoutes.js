const express = require('express');
const router = express.Router();
const upload = require('../middlewares/uploadMiddleware');
const { getAllServices, getServiceById, createService, updateService, deleteService, toggleService } = require('../controllers/serviceController');

router.get('/', getAllServices);
router.get('/:id', getServiceById);
// Define the POST route with multer middleware
router.post('/', upload.single('image'), createService);
// router.post('/', createService);
router.put('/:id', updateService);
router.delete('/:id', deleteService);
router.patch('/:id/toggle', toggleService); // Endpoint for toggling service status

module.exports = router;
