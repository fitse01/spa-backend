const express = require('express');
const router = express.Router();
const { authorizeAdmin } = require('../middlewares/authMiddleware');

// Example admin route
router.get('/admin-only', authorizeAdmin, (req, res) => {
  res.json({ message: 'Welcome, Admin!' });
});

module.exports = router;
