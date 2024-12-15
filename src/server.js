// // src/server.js

const app = require('./app');
const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});



// const express = require('express');
// const dotenv = require('dotenv');
// const authRoutes = require('./routes/authRoute');
// const {authorizeAdmin} = require('./middlewares/authMiddleware');

// dotenv.config();
// const app = express();

// // Middleware
// app.use(express.json());

// // Routes
// app.use('/api/v1', authRoutes);


// // Example protected route for admin users only
// app.get('/api/admin', authorizeAdmin, (req, res) => {
//   res.send('Welcome Admin!');
// });

// Server setup
// const PORT = process.env.PORT || 5000;
// app.listen(PORT, () => {
//   console.log(`Server running on port ${PORT}`);
// });
