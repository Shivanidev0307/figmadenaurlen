const express = require('express');
const mongoose = require('mongoose');

const app = express();
const PORT = process.env.PORT || 3000;

// Connect to MongoDB
mongoose.connect('mongodb://localhost/valuation-app', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

// Create routes for user registration and valuation updates

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
