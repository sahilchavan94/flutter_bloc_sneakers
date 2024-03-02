class Validator {
  static dynamic validateNames(String? name) {
    if (name!.length < 2) {
      return "Name cannot be empty";
    }
    return null;
  }

  static dynamic validatePhone(String? phone) {
    RegExp regex = RegExp(r'^(\d{10})$');
    if (!regex.hasMatch(phone!)) {
      return "Phone number must be 10 digits";
    }
    return null;
  }

  static dynamic validateEmail(String? email) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regex.hasMatch(email!)) {
      return "Invalid email format";
    }
    return null;
  }

  static dynamic validatePassword(String? password) {
    if (password!.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  static dynamic validatePasswordConfirm(
    String? password, String? confirmPassword) {
    if (password! != confirmPassword!) {
      return "Passwords do not match";
    }
    return null;
  }

  static dynamic validatePlace(String? place){
    if (place!.length < 3) {
      return "Invalid value";
    }
    return null;
  }

  static dynamic validatePincode(String? pincode) {
    RegExp regex = RegExp(r'^(\d{6})$');
    if (!regex.hasMatch(pincode!)) {
      return 'Invalid pincode';
    }
    return null;
  }

  static dynamic validateStreetAddress(String? address) {
    RegExp regex = RegExp(r'^[#.0-9a-zA-Z\s,-]+$');
    if (!regex.hasMatch(address!)) {
      return 'Invalid address format';
    }
    return null;
  }
}
