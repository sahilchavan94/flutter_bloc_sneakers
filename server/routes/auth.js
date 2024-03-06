const router = require("express").Router();
const { check, validationResult } = require("express-validator");
const { handleSignup,handleSignin, handleFetchUser } = require("../controllers/auth_controller");
const fetchUser = require("../middlewares/fetchUser");

//handling the create account requests
router.post(
  "/signup",
  [
    check("firstname").isString().isLength({ min: 2 }).withMessage('Invalid firstname'),
    check("lastname").isString().isLength({ min: 2 }).withMessage('Invalid lastname'),
    check("mobile").isMobilePhone().withMessage('Invalid mobile number'),
    check("email").isEmail().withMessage('Invalid email'),
    check("password").trim().isLength({ min: 6, max: 15 }).withMessage('Invalid password'),
  ],
  handleSignup
);

//handling the signin requests
router.post(
  "/signin",
  [
    check("email").isEmail().withMessage('Invalid email'),
    check("password").trim().isLength({ min: 6, max: 15 }).withMessage('Invalid password'),
  ],
  handleSignin
);


//handling the get user requests
router.post("/get-user",fetchUser,handleFetchUser)

module.exports = router;
