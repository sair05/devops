const express = require('express');
const path = require('path');
const app = express();
const PORT = process.env.PORT || 3000;

// Serve static files (CSS/Images) if you add any later
app.use(express.static('public'));

// Route for Home Page
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Route for Items Page
app.get('/items', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'items.html'));
});

app.listen(PORT, () => {
    console.log(`E-commerce app running at http://localhost:${PORT}`);
});
