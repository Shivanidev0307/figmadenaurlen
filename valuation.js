
const express = require('express');
const router = express.Router();
const Valuation = require('../models/Valuation');

router.post('/update', async (req, res) => {
  try {
    const { userId, netCoins, grossCoins } = req.body;
    const valuation = new Valuation({ userId, netCoins, grossCoins });
    const savedValuation = await valuation.save();
    res.json(savedValuation);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
});

module.exports = router;
