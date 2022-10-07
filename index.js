const express = require("express");
const bodyParser = require("body-parser");
const cookieSession = require("cookie-session");
const cors = require("cors");

const app = express();
const port = 3000;

// router reference
const productsRouter = require("./routes/products");
const authRouter = require("./routes/auth");
const testRouter = require("./routes/user");

// cors
app.use(cors());

// express
app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

// cookie-session
app.use(cookieSession({
    name: 'session',
    secret: "COOKIE_SECRET",    // should use as secret environment variable
    httpOnly: true
}));

// main routers
app.get('/', (req, res) => {
    res.send("Website is under construction");
});
app.use('/api/1/products', productsRouter);
app.use('/admin', express.static('admin'));
app.use('/upload/images', express.static('upload/images'));
app.use('/api/1/auth', authRouter);
app.use('/api/1/test', testRouter);

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