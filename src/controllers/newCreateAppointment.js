// const PrismaClient =require( "@prisma/client")
// const prisma = new PrismaClient()
//
//
// exports.createAppointment = (req, res)=>{
//     const {full_name, date, message, service, email} = req.body
//
//
//     try{
//         const appointment = prisma.appointment.create({
//             data: {
//                 full_name,
//                 date,
//                 service,
//                 message,
//                 email
//             }
//
//         })
//         res.status(201).json{appointment}
//     }catch (e) {
//         res.status(500).json(appointment)
//     }
// }