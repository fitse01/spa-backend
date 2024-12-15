const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const prisma = require("../models/user");

// Register User or Admin
exports.register = async (req, res) => {
  const { email, password, role, age } = req.body;

  // if (!age) {
  //   return res.status(400).json({ error: "Age is required" });
  // }

  try {
    const existingUser = await prisma.user.findUnique({ where: { email } });
    if (existingUser) {
      return res.status(400).json({ error: "User already exists" });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const user = await prisma.user.create({
      data: {
        email,
        password: hashedPassword,
        role: role === "admin" ? "admin" : "user", // Role validation
        age,
      },
    });

    res.status(201).json({
      message: `${role === "admin" ? "Admin" : "User"} registered successfully`,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "User registration failed" });
  }
};

// Login
exports.login = async (req, res) => {
  const { email, password } = req.body;

  try {
    const user = await prisma.user.findUnique({ where: { email } });

    if (!user || !(await bcrypt.compare(password, user.password))) {
      return res.status(401).json({ error: "Invalid email or password" });
    }

    const token = jwt.sign(
      { userId: user.id, role: user.role }, // Include role in payload
      process.env.JWT_SECRET,
      { expiresIn: "1d" }
    );

    res.status(200).json({ token, user });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Login failed" });
  }
};
