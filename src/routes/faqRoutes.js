const express = require('express');
const faqController = require('../controllers/faqController');
const router = express.Router();
const {createFAQ,
    getAllFAQs,
    getFAQById,
    updateFAQ,
    deleteFAQ,
    searchFAQs} = require('../controllers/faqController')

router.post('/create-faq', createFAQ);
router.get('/get-faq', getAllFAQs);
router.get('/get-faq/:id', getFAQById);
router.put('/update-faq/:id', updateFAQ);
router.delete('/delete-faq/:id', deleteFAQ);
router.get('/search', searchFAQs);

module.exports = router;
