const prisma = require('../config/prismaClient');

// Create a new count animation
const createCountAnimation = async (req, res) => {
    const { number, title, animationDuration, animationType, status } = req.body;
  
    // Validate input
    if (typeof number !== 'number' || !title) {
      return res.status(400).json({ error: 'Invalid input data.' });
    }
  
    try {
      const countAnimation = await prisma.countAnimation.create({
        data: {
          number,
          title,
          animationDuration: animationDuration || null,
          animationType: animationType || null,
          status: status || 'ACTIVE',
        },
      });
      res.status(201).json(countAnimation);
    } catch (error) {
      console.error(error); // Log the error for debugging
      res.status(500).json({ error: 'Failed to create count animation.' });
    }
  };



// Retrieve all count animations
const getAllCountAnimations = async (req, res) => {
  try {
    const countAnimations = await prisma.countAnimation.findMany();
    res.json(countAnimations);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch count animations.' });
  }
};

// Retrieve a specific count animation by ID
const getCountAnimationById = async (req, res) => {
  const { id } = req.params;
  try {
    const countAnimation = await prisma.countAnimation.findUnique({
      where: { id: parseInt(id, 10) },
    });
    if (!countAnimation) {
      return res.status(404).json({ error: 'Count animation not found.' });
    }
    res.json(countAnimation);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch count animation.' });
  }
};

// Update an existing count animation
const updateCountAnimation = async (req, res) => {
  const { id } = req.params;
  const { number, title, animationDuration, animationType, status } = req.body;
  try {
    const updatedCountAnimation = await prisma.countAnimation.update({
      where: { id: parseInt(id, 10) },
      data: { number, title, animationDuration, animationType, status },
    });
    res.json(updatedCountAnimation);
  } catch (error) {
    res.status(500).json({ error: 'Failed to update count animation.' });
  }
};

// Delete a count animation by ID
const deleteCountAnimation = async (req, res) => {
  const { id } = req.params;
  try {
    await prisma.countAnimation.delete({ where: { id: parseInt(id, 10) } });
    res.status(201).json({msg :"count animation delete "})
  } catch (error) {
    res.status(500).json({ error: 'Failed to delete count animation.' });
  }
};

// Search count animations by title
const searchCountAnimations = async (req, res) => {
  const { title } = req.query;
  try {
    const countAnimations = await prisma.countAnimation.findMany({
      where: {
        title: {
          contains: title,
          mode: 'insensitive',
        },
      },
    });
    res.json(countAnimations);
  } catch (error) {
    res.status(500).json({ error: 'Failed to search count animations.' });
  }
};

module.exports={
    createCountAnimation,
    getAllCountAnimations,
    getCountAnimationById,
    updateCountAnimation,
    deleteCountAnimation,
    searchCountAnimations
}