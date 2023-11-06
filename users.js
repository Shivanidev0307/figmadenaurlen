const express = require('express');
const router = express.Router();
const { User } = require('./valuation_app_db'); 

// Define a route to create a new user
router.post('/users', async (req, res) => {
  try {
    const newUser = new User({
      name: req.body.name,
      username: req.body.username,
    })

    await newUser.save();
    res.status(201).json(newUser);
  } catch (error) {
    res.status(500).json({ error: 'User registration failed' });
  }
});

module.exports = router;
