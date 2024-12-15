const express = require('express');
const multer = require('multer');
const {
  createPricing,
  getAllPricing,
  getPricingById,
  updatePricing,
  deletePricing,
} = require('../controllers/pricingController');

const router = express.Router();
const upload = multer({ dest: 'uploads/' });

router.post('/create-price', upload.single('image'), createPricing);
router.get('/get-price', getAllPricing);
router.get('/get-price/:id', getPricingById);
router.put('/update-price/:id', upload.single('image'), updatePricing);
router.delete('/delete-price/:id', deletePricing);

module.exports = router;
