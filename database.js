const mongoose = require('mongoose');

// Define the MongoDB connection URI 
const mongoURI = 'mongodb://localhost:27017/valuation_app_db';

// Connect to MongoDB
mongoose.connect(mongoURI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const db = mongoose.connection;

db.on('error', console.error.bind(console, 'MongoDB connection error:'));
db.once('open', () => {
  console.log('Connected to MongoDB');
});

// Define a schema for the data
const userSchema = new mongoose.Schema({
  name: String,
  username: String,
});

// Create a model based on the schema
const User = mongoose.model('User', userSchema);

module.exports = {
  User, 
};
