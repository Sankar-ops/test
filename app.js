// Load the HTTP and FS modules
const http = require('http');
const fs = require('fs');
const path = require('path');

// Define the port to listen on
const port = 3000;

// Create a server that responds with the contents of index.html
const server = http.createServer((req, res) => {
    // Set the path to the HTML file
    const filePath = path.join(__dirname, 'index.html');

    // Read the HTML file and send it in the response
    fs.readFile(filePath, (err, data) => {
        if (err) {
            res.statusCode = 500;
            res.setHeader('Content-Type', 'text/plain');
            res.end('Server error\n');
            return;
        }
        res.statusCode = 200;
        res.setHeader('Content-Type', 'text/html');
        res.end(data);
    });
});

// Start the server and listen on the specified port
server.listen(port, () => {
    console.log(`Server running at http://localhost:${port}/`);
});
