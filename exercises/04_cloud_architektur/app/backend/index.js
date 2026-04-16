const express = require('express');
const cors = require('cors');
const app = express();
const port = process.env.PORT || 8080;

app.use(cors());
app.use(express.json());

// Mock-Daten für Sneaker (Simulation einer Datenbank)
const products = [
  { id: 1, name: "Cloud-Sneaker X1", price: 129.99, image: "https://storage.googleapis.com/YOUR_BUCKET_NAME/sneaker1.jpg" },
  { id: 2, name: "Retro Cloud 1990", price: 89.50, image: "https://storage.googleapis.com/YOUR_BUCKET_NAME/sneaker2.jpg" },
  { id: 3, name: "GCP Runner Ultra", price: 159.00, image: "https://storage.googleapis.com/YOUR_BUCKET_NAME/sneaker3.jpg" }
];

// Tier 2: Logic - Katalog-Service
app.get('/api/products', (req, res) => {
  console.log('GET /api/products - Request received');
  res.json(products);
});

// Tier 2: Logic - Bestell-Service (Simulation)
app.post('/api/orders', (req, res) => {
  const order = req.body;
  console.log('POST /api/orders - New Order:', order);
  res.status(201).json({ message: "Bestellung erfolgreich aufgegeben!", orderId: Math.floor(Math.random() * 10000) });
});

app.get('/', (req, res) => {
  res.send('Cloud-Store Backend is running! 🚀');
});

app.listen(port, () => {
  console.log(`Backend listening at http://localhost:${port}`);
});
