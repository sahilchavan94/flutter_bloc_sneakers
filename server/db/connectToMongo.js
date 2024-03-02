const mongoose = require("mongoose");

const connectToMongo = () => {
  mongoose
    .connect("mongodb://localhost:27017/fluttersneakers")
    .then(() => {
      console.log("Connected to MongoDB");
    })
    .catch(() => {
      console.log("Error connecting to MongoDB");
    });
};

module.exports = connectToMongo;
