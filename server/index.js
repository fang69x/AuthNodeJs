const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routers/auth");
require("dotenv").config();

const PORT = process.env.PORT || 3000;
const app = express();

app.use(express.json());
app.use(authRouter); // Use the authRouter for routing

const DB = process.env.DB_URL; // Ensure the environment variable is DB_URL

mongoose.connect(DB)
    .then(() => {
        console.log("Connection successful");
    })
    .catch((e) => {
        console.log(e);
    });


app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connected to port ${PORT}`);
});
