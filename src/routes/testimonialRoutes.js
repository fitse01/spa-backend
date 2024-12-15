const express = require('express');
const multer = require('multer');
const {
    getAllTestimonials,
    getTestimonialById,
    createTestimonial,
    updateTestimonial,
    deleteTestimonial
} = require('../controllers/testimonialController');

const router = express.Router();
const upload = multer({ dest: 'uploads/' }); // Temporary storage for images

router.get('/get-testimonials', getAllTestimonials);
router.get('/get-testimonials/:id', getTestimonialById);
router.post('/create-testimonials', upload.single('image'), createTestimonial);
router.put('/update-testimonials/:id', upload.single('image'), updateTestimonial);
router.delete('/delete-testimonials/:id', deleteTestimonial);

module.exports = router;
