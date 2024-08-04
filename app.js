// Load the HTTP module
const http = require('http');

// Define the port to listen on
const port = 3000;

// Create a server that responds with "Hello, World!"
const server = http.createServer((req, res) => {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Hello, World!\n');
});

// Start the server and listen on the specified port
server.listen(port, () => {
    console.log(`Server running at http://localhost:${port}/`);
});
