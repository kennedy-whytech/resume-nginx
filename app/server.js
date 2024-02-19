const express = require('express');
const fs = require('fs');
const app = express();
const port = 80;

app.engine('html', require('ejs').renderFile);

app.use(express.static('public'));

// Set the views directory
app.set('views', './views');

// Define the title variable
const title = process.env.TITLE || "To be updated";

// Function to render HTML pages
const renderPage = (fileName, res) => {
    const filePath = `${fileName}.ejs`; // Add the file extension
    fs.readFile(`views/${filePath}`, 'utf8', (err, data) => {
        if (err) {
            res.status(500).send('Error reading file');
            return;
        }
        // Render the HTML page with the title variable
        res.render(filePath, { title: title });
    });
};

app.get('/', (req, res) => {
    renderPage('index', res);
});

app.get('/page1', (req, res) => {
    renderPage('page1', res);
});

app.get('/page2', (req, res) => {
    renderPage('page2', res);
});

app.get('/config', (req, res) => {
    renderPage('config', res);
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
