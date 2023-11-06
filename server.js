const express = require('express');
const app = express();
const bodyParser = require('body-parser');

// Middleware to parse JSON in request body
app.use(bodyParser.json());

// Other middleware and configurations...

// Import the users route file
const usersRouter = require('./users');

// Use the users route with a prefix
app.use('/api', usersRouter);

// Start the server
app.listen(3000, () => {
  console.log('Server is running on port 3000');
});
