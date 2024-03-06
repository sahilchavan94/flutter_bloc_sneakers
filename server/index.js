//module imports
const express = require("express");
const dotenv = require("dotenv");
const cors = require("cors");
const connectToMongo = require("./db/connectToMongo");

//module initializations
const app = express();
dotenv.config();
connectToMongo(); //connecting to the mongo db database

//getting the ports
const PORT = process.env.PORT;

//using middlewares
app.use(express.json());
app.use(cors({ origin: "*" }));

//using thr routes
app.use("/flutter_sneakers/api/auth", require("./routes/auth"));

//Node.js is listening on the port number xxxx
app.listen(PORT, () => {
  console.log("Server is running on port " + PORT);
});
