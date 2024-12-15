// // src/routes/userRoutes.js

const express = require("express");
const { getAllUsers, createUser } = require("../controllers/userController");
const { authorizeAdmin } = require("../middlewares/authMiddleware");
const router = express.Router();

router.get("/login", getAllUsers); // Protected route for admins only
router.post("/create_user", createUser); // Admins create users

module.exports = router;
