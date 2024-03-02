const mongoose = require("mongoose");

//user model to store the user data
const userSchema = new mongoose.Schema({
  firstname: {
    type: String,
    required: true,
  },

  lastname: {
    type: String,
    required: true,
  },

  email: {
    type: String,
    required: true,
    unique: true,
  },

  password: {
    type: String,
    required: true,
  },

  mobile: {
    type: Number,
    required: true,
  },

  country: {
    type: String,
    required: true,
  },

  state: {
    type: String,
    required: true,
  },

  city: {
    type: String,
    required: true,
  },

  address: {
    type: String,
    required: true,
  },

  pincode: {
    type: Number,
    required: true,
  },

  landmark: {
    type: String,
    required: true,
  },
});

const User = mongoose.model("User", userSchema);
module.exports = User;
