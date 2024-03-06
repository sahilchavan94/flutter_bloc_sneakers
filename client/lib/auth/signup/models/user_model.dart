//this is the user model which will hold the state data of the form
class UserModel {
  final String firstname;
  final String lastname;
  final String mobile;
  final String email;
  final String password;

  UserModel({
    required this.firstname,
    required this.lastname,
    required this.mobile,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstname: json['firstname'],
      lastname: json['lastname'],
      mobile: json['mobile'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'firstname': firstname,
        'lastname': lastname,
        'mobile': mobile,
        'email': email,
        'password': password,
      };
}
