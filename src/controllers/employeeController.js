const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const cloudinary = require("../config/cloudinary");
const fs = require("fs");

// Get all employees
const getAllEmployees = async (req, res) => {
  try {
    const employees = await prisma.employee.findMany();
    res.json(employees);
    console.log(employees);
  } catch (error) {
    console.error("Error fetching employees:", error);
    res.status(500).json({ error: "Error fetching employees", error });
  }
};

// Get an employee by ID
const getEmployeeById = async (req, res) => {
  const { id } = req.params;
  try {
    const employee = await prisma.employee.findUnique({
      where: { id: parseInt(id) },
    });
    if (!employee) return res.status(404).json({ error: "Employee not found" });
    res.json(employee);
  } catch (error) {
    console.error("Error fetching employee:", error);
    res.status(500).json({ error: "Error fetching employee" });
  }
};

// Create a new employee
const createEmployee = async (req, res) => {
  try {
    const { path } = req.file; // Get the file path from multer
    const {
      full_name,
      email,
      phone_no,
      position,
      experience_years,
      personal_info,
      skills,
      employment_status,
      role,
    } = req.body;
    const parsedSkills = skills ? JSON.parse(skills) : [];
    console.log(req.body);

    // Check if an employee with the same email already exists
    const existingEmployee = await prisma.employee.findUnique({
      where: { email },
    });

    if (existingEmployee) {
      // If the employee already exists, respond with a 409 Conflict status
      return res.status(409).json({ error: "Employee already exists" });
    }

    // Upload image to Cloudinary
    const result = await cloudinary.uploader.upload(path);

    // Remove local file after uploading to Cloudinary
    fs.unlinkSync(path);

    // Save employee to the database
    const employee = await prisma.employee.create({
      data: {
        full_name,
        email,
        image_url: result.secure_url,
        phone_no,
        position,
        experience_years: parseInt(experience_years),
        personal_info,
        skills: parsedSkills, // Assuming skills are sent as JSON array
        employment_status,
        role,
        // Assuming social media links are sent as JSON array
      },
    });

    res.status(201).json(employee);
  } catch (error) {
    console.error("Error creating employee:", error);
    res.status(500).json({ error: "Error creating employee", error });
  }
};

const updateEmployee = async (req, res) => {
  const { id } = req.params;
  const {
    full_name,
    email,
    phone_no,
    position,
    experience_years,
    personal_info,
    skills,
    employment_status,
    role,
    social_media,
    image_url,
  } = req.body;

  try {
    const updatedData = {};

    // Update only fields that are provided in the request body
    if (full_name !== undefined) updatedData.full_name = full_name;
    if (email !== undefined) updatedData.email = email;
    if (phone_no !== undefined) updatedData.phone_no = phone_no;
    if (position !== undefined) updatedData.position = position;
    if (experience_years !== undefined)
      updatedData.experience_years = parseInt(experience_years);
    if (personal_info !== undefined) updatedData.personal_info = personal_info;
    if (skills !== undefined) updatedData.skills = skills;
    if (employment_status !== undefined)
      updatedData.employment_status = employment_status;
    if (role !== undefined) updatedData.role = role;
    if (social_media !== undefined) updatedData.social_media = social_media;
    if (image_url !== undefined) updatedData.image_url = image_url;

    // Only proceed if there's data to update
    if (Object.keys(updatedData).length === 0) {
      return res.status(400).json({ error: "No fields to update" });
    }

    const updatedEmployee = await prisma.employee.update({
      where: { id: parseInt(id) },
      data: updatedData,
    });

    res.json(updatedEmployee);
  } catch (error) {
    console.error("Error updating employee:", error);
    res.status(500).json({ error: "Error updating employee" });
  }
};

// Delete an employee
const deleteEmployee = async (req, res) => {
  const { id } = req.params;
  try {
    await prisma.employee.delete({ where: { id: parseInt(id) } });
    res.json({ message: "Employee deleted" });
  } catch (error) {
    console.error("Error deleting employee:", error);
    res.status(500).json({ error: "Error deleting employee" });
  }
};

// Toggle employment status
const toggleEmployeeStatus = async (req, res) => {
  const { id } = req.params;
  try {
    const employee = await prisma.employee.findUnique({
      where: { id: parseInt(id) },
    });
    if (!employee) return res.status(404).json({ error: "Employee not found" });

    const updatedEmployee = await prisma.employee.update({
      where: { id: parseInt(id) },
      data: {
        employment_status:
          employee.employment_status === "Active" ? "On Leave" : "Active",
      },
    });
    res.json(updatedEmployee);
  } catch (error) {
    console.error("Error toggling employee status:", error);
    res.status(500).json({ error: "Error toggling employee status" });
  }
};

module.exports = {
  getAllEmployees,
  getEmployeeById,
  createEmployee,
  updateEmployee,
  deleteEmployee,
  toggleEmployeeStatus,
};
