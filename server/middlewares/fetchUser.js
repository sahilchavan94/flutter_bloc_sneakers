const jwt = require("jsonwebtoken");
const dotenv = require("dotenv");
dotenv.config();

const fetchUser = (req, res, next) => {
  //get the authentication token from the request header
  const authToken = req.header("authToken");

  //if the token is not found
  if (!authToken) {
    return res.status(400).json({
      status: "error",
      message: "Authentication token is not found",
    });
  }

  //else try to verify the authentication token and modify the request object
  try {
    //verify the token and get the payload
    const data = jwt.verify(authToken, process.env.JWT_SECRET_KEY);

    //modify the request object as data payload
    req.userId = data.payload;

    //call the next method
    next();
  } catch (e) {
    console.log(e.message);
    res.status(401).json({
      status: "error",
      message: "Internal server error",
    });
  }
};


module.exports = fetchUser