const { validationResult, matchedData } = require("express-validator");
const bcrypt = require("bcryptjs");
const dotenv = require("dotenv");
const jwt = require("jsonwebtoken");
const User = require("../models/User");
dotenv.config();

//method to handle the signup event
const handleSignup = async (req, res) => {
  //check whether the data is validated properly or not
  const validationErrors = validationResult(req);

  //if the data is not validated return the error
  if (!validationErrors.isEmpty()) {
    return res.json({
      status: "data validation error",
      messages: validationErrors.array(),
    });
  }

  //else create a new user
  //store the user details in the mongo database
  //return the authentication token

  //getting the matchedData from request body through express validator
  const data = matchedData(req);

  try {
    //create salt with bcryptjs
    const salt = await bcrypt.genSalt(10);

    //hash the password
    const hashedPassword = await bcrypt.hash(data.password, salt);

    //modifying the data object for the hashed password
    data.password = hashedPassword;

    //check whether users with same email id previously exists
    const previousUser = await User.findOne({ email: data.email });

    //if the email is taken then return an relevant error message
    if (previousUser) {
      return res.status(400).json({
        status: "error",
        message: "User with this email id already exists",
      });
    }

    //else create a new user instance and save it in the database
    const newUser = await User.create(data);

    //create an authentication token with help of new user's id and your secret key
    const authToken = jwt.sign(
      { payload: newUser.id },
      process.env.JWT_SECRET_KEY
    );

    //return the auth token along with the user details and messages
    return res.status(200).json({
      status: "success",
      message: "Registration process completed successfully",
      authToken,
    });
  } catch (e) {
    return res.status(401).json({
      status: "error",
      message: "Internal server error",
    });
  }
};

//method to handle the signin event
const handleSignin = async (req, res) => {
  //check whether the data is validated properly or not
  const validationErrors = validationResult(req);

  //if the data is not validated return the error
  if (!validationErrors.isEmpty()) {
    return res.json({
      status: "data validation error",
      messages: validationErrors.array(),
    });
  }

  //getting the matchedData from request body through express validator
  const data = matchedData(req);

  try {
    //check whether user with the provided email id previously exists
    const user = await User.findOne({ email: data.email });

    //if the user is not found then return a relevant error message
    if (!user) {
      return res.status(400).json({
        status: "error",
        message: "Try to signin with valid credentials",
      });
    }

    //else compare the password with hashed password
    const passwordComparison = await bcrypt.compare(
      data.password,
      user.password
    );

    //if the passwords matches then return a success message and the authentication token to the user
    if (passwordComparison) {
      //generate a new authentication token and return the result
      const authToken = jwt.sign(
        { payload: user.id },
        process.env.JWT_SECRET_KEY
      );

      return res.status(200).json({
        status: "success",
        message: "Welcome back",
        authToken,
      });
    }

    //if the password doesn't matches then respond with a relevant message
    return res.status(400).json({
      status: "error",
      message: "Try to signin with valid credentials",
    });
  } catch (e) {
    return res.status(401).json({
      status: "error",
      message: "Internal server error",
    });
  }
};

//method to fetch the user data from the database based on the encrypted authentication token
const handleFetchUser = async (req, res) => {
  try {
    //get the user id from the modified request object
    const userId = req.userId;

    //find the user with that specific id - except the password
    const user = await User.findById(userId).select("-password -_id -__v");

    //if the user is not found
    if (user === null) {
      //return the relavent message
      return res.status(200).json({
        status: "error",
        message: "User not found",
      });
    }

    //else return the appropriate user data
    return res.status(200).json({ status: "success", user });
  } catch (e) {
    res.status(401).json({
      status: "error",
      message: "Internal server error",
    });
  }
};

module.exports = {
  handleSignup,
  handleSignin,
  handleFetchUser,
};
