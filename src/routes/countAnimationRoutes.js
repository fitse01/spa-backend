// src/routes/countAnimationRoutes.js

const express = require('express');
const router = express.Router();
const { createCountAnimation,
    getAllCountAnimations,
    getCountAnimationById,
    updateCountAnimation,
    deleteCountAnimation,
    searchCountAnimations} = require('../controllers/countAnimationController');

router.post('/create-animation', createCountAnimation);
router.get('/get-animation', getAllCountAnimations);
router.get('/get-animation/:id', getCountAnimationById);
router.put('/update-animation/:id', updateCountAnimation);
router.delete('/delete-animation/:id', deleteCountAnimation);
router.get('/create-animation/search', searchCountAnimations);

module.exports = router;
