const express = require('express');
const videoController = require('../controllers/videoController');
const router = express.Router();
const {createVideo,
    getAllVideos,
    getVideoById,
    updateVideo,
    deleteVideo,
    searchVideos} = require('../controllers/videoController')
router.post('/create-video', createVideo);
router.get('/get-video', getAllVideos);
router.get('/get-video/:id', getVideoById);
router.put('/update-video/:id', updateVideo);
router.delete('/delete-video/:id', deleteVideo);
router.get('/search', searchVideos);

module.exports = router;
