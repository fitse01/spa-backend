const prisma = require('../config/prismaClient');

// Create a new video
const createVideo = async (req, res) => {
  try {
    const video = await prisma.video.create({
      data: req.body,
    });
    res.status(201).json(video);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Get all videos
const getAllVideos = async (req, res) => {
  try {
    const videos = await prisma.video.findMany({
      where: {
        status: 'ACTIVE',
      },
    });
    res.json(videos);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Get video by ID
const getVideoById = async (req, res) => {
  try {
    const video = await prisma.video.findUnique({
      where: { id: parseInt(req.params.id) },
    });
    if (video) {
      res.json(video);
    } else {
      res.status(404).json({ error: 'Video not found' });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Update a video
const updateVideo = async (req, res) => {
    const { id } = req.params;
    const {
      title,
      link,
      thumbnail,
      description,
      duration,
      status
    } = req.body;
  
    try {
      const updatedData = {};
  
      // Update only fields that are provided in the request body
      if (title !== undefined) updatedData.title = title;
      if (link !== undefined) updatedData.link = link;
      if (thumbnail !== undefined) updatedData.thumbnail = thumbnail;
      if (description !== undefined) updatedData.description = description;
      if (duration !== undefined) updatedData.duration = parseInt(duration);
      if (status !== undefined) updatedData.status = status;
  
      // Only proceed if there's data to update
      if (Object.keys(updatedData).length === 0) {
        return res.status(400).json({ error: 'No fields to update' });
      }
  
      const updatedVideo = await prisma.video.update({
        where: { id: parseInt(id) },
        data: updatedData,
      });
  
      res.json(updatedVideo);
    } catch (error) {
      console.error("Error updating video:", error);
      res.status(500).json({ error: 'Error updating video' });
    }
  };

// Delete a video
const deleteVideo = async (req, res) => {
  try {
    await prisma.video.delete({
      where: { id: parseInt(req.params.id) },
    });
    res.status(201).json({msg:'video deleted successfully'});
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Search videos by title
const searchVideos = async (req, res) => {
  try {
    const { query } = req.query;
    const videos = await prisma.video.findMany({
      where: {
        title: {
          contains: query,
          mode: 'insensitive',
        },
        status: 'ACTIVE',
      },
    });
    res.json(videos);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
module.exports ={
    createVideo,
    getAllVideos,
    getVideoById,
    updateVideo,
    deleteVideo,
    searchVideos
}