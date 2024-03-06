import 'dart:convert';

import 'package:client/auth/signup/models/user_model.dart';
import 'package:http/http.dart' as http;

class SignupRepo {
  //this class will hold all the crud method related to the signup process

  //method to signup the user and to create a new account
  static Future createUser(UserModel userModel) async {
    var url = "http://localhost:9400/flutter_sneakers/api/auth/signup";
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
       userModel.toJson()
      ),
    );

    return jsonDecode(response.body);
  }
}
