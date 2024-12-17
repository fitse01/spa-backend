const express = require('express');
const multer = require('multer');
const router = express.Router();
const {
  getAllProducts,
  getProductById,
  createProduct,
  updateProduct,
  deleteProduct,
} = require('../controllers/productController');

// Multer setup for file uploads
const upload = multer({ dest: 'uploads/' });

// Routes
router.get('/get-all-product', getAllProducts);
router.get('/get-product-id/:id', getProductById);
router.post('/create-product', upload.array('images', 5), createProduct); // Accept up to 5 images
router.put('/update-product-id/:id', upload.array('images', 5), updateProduct); // Accept up to 5 images
router.delete('/delete-product-id/:id', deleteProduct);

module.exports = router;
