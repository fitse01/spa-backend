// Import the Prisma client
const { prisma } = require("../config/prismaClient"); // Use 'import' if using ESModules
// import {prisma } from "../config/prismaClient"
// Create Appointment
exports.createAppointment = async (req, res) => {
  const { full_name, email, service, date, message } = req.body;

  try {
    const appointment = await prisma.appointment.create({
      data: { full_name, email, service, date: new Date(date), message },
    });
    console.log("Appointment created:", appointment);
    res.status(201).json(appointment);
  } catch (error) {
    console.error("Error creating appointment:", error);
    res.status(500).json({ error: "Unexpected error occurred" });
  }
};

// Get All Appointments
exports.getAllAppointments = async (req, res) => {
  try {
    const appointments = await prisma.appointment.findMany();
    res.json(appointments);
  } catch (error) {
    console.error("Error retrieving appointments:", error);
    res.status(500).json({ error: "Error retrieving appointments" });
  }
};

// Get Appointment by ID
exports.getAppointmentById = async (req, res) => {
  const { id } = req.params;

  try {
    const appointment = await prisma.appointment.findUnique({ where: { id: Number(id) } });
    if (!appointment) {
      return res.status(404).json({ error: "Appointment not found" });
    }
    res.json(appointment);
  } catch (error) {
    console.error("Error retrieving appointment:", error);
    res.status(500).json({ error: "Error retrieving appointment" });
  }
};

// Update Appointment
exports.updateAppointment = async (req, res) => {
  const { id } = req.params;
  const { full_name, email, service, date, message, payment_status, appointment_status, cancellation_reason } = req.body;

  try {
    const updatedData = {};

    // Only update fields provided in the request body
    if (full_name) updatedData.full_name = full_name;
    if (email) updatedData.email = email;
    if (service) updatedData.service = service;
    if (date) updatedData.date = new Date(date);
    if (message) updatedData.message = message;
    if (payment_status) updatedData.payment_status = payment_status;
    if (appointment_status) updatedData.appointment_status = appointment_status;
    if (cancellation_reason) updatedData.cancellation_reason = cancellation_reason;

    const appointment = await prisma.appointment.update({
      where: { id: Number(id) },
      data: updatedData,
    });

    res.json(appointment);
  } catch (error) {
    console.error("Error updating appointment:", error);
    res.status(500).json({ error: "Error updating appointment" });
  }
};

// Delete Appointment
exports.deleteAppointment = async (req, res) => {
  const { id } = req.params;

  try {
    await prisma.appointment.delete({ where: { id: Number(id) } });
    res.status(200).json({ message: "Appointment deleted successfully" });
  } catch (error) {
    console.error("Error deleting appointment:", error);
    res.status(500).json({ error: "Error deleting appointment" });
  }
};
