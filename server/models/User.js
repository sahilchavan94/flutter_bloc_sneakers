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
  },

  state: {
    type: String,
  },

  city: {
    type: String,
  },

  address: {
    type: String,
  },

  pincode: {
    type: Number,
  },

  landmark: {
    type: String,
  },
});

const User = mongoose.model("User", userSchema);
module.exports = User;
