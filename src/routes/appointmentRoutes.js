const express = require('express');
const router = express.Router();
const {getAllAppointments , getAppointmentById, updateAppointment, deleteAppointment, createAppointment} = require('../controllers/appointmentController');
// const {createAppointment} = require("../controllers/newCreateAppointment");

// Appointment CRUD routes
router.post('/', createAppointment );
router.get('/', getAllAppointments);
router.get('/:id', getAppointmentById);
router.put('/:id', updateAppointment);
router.delete('/:id', deleteAppointment);

module.exports = router;
