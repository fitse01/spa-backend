const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const prisma = require("../models/user");

// Register User or Admin
exports.register = async (req, res) => {
  const { email, password, role, age } = req.body;

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





// Update User Email and Password
exports.updateUser = async (req, res) => {
  try {
    const { id } = req.params;
    const { email, password, role, age } = req.body;

    // Data object for fields to be updated
    const updateData = {};

    if (email) {
      const existingUser = await prisma.user.findUnique({ where: { email } });
      if (existingUser) {
        return res.status(400).json({ error: "Email is already in use" });
      }
      updateData.email = email;
    }

    if (password) {
      const hashedPassword = await bcrypt.hash(password, 10);
      updateData.password = hashedPassword;
    }

    if (role) {
      if (!["admin", "user"].includes(role)) {
        return res.status(400).json({ error: "Invalid role provided" });
      }
      updateData.role = role;
    }


    const updatedUser = await prisma.user.update({
      where: { id: parseInt(id) },
      data: updateData,
    });

    res.status(200).json({
      message: "User updated successfully",
      user: updatedUser,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to update user" });
  }
};
