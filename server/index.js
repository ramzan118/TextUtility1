require('dotenv').config();
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

// Connect to Cosmos DB
mongoose.connect(process.env.MONGODB_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true
});

// Define schema and model
const itemSchema = new mongoose.Schema({
  name: String,
  value: Number,
  content: String
}, { timestamps: true });

const Item = mongoose.model('Item', itemSchema);

// API Endpoint
app.get('/api/data', async (req, res) => {
  try {
    const items = await Item.find().sort({ createdAt: -1 }).limit(20);
    res.json({ items });
  } catch (err) {
    console.error('Database error:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Serve React frontend
app.use(express.static('public'));

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
