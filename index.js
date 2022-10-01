const express = require("express");
const bodyParser = require("body-parser");

const app = express();
const port = 3000;
const productsRouter = require("./routes/products");

// express
app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

app.get('/', (req, res) => {
    res.send("Website is under construction");
});

app.use('/api/1/products', productsRouter);
app.use('/admin', express.static('admin'));
app.use('/upload/images', express.static('upload/images'));

/* Error handler middleware */
app.use((err, req, res, next) => {
    const statusCode = err.statusCode || 500;
    console.error(err.message, err.stack);
    res.status(statusCode).json({ message: err.message });
    return;
});

app.listen(port, () => {
    console.log(`Now listening at http://localhost:${port}`);
});