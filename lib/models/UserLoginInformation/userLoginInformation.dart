// ignore_for_file:  file_names, avoid_print,prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables

class UserLoginInformation {
  UserLoginInformation({
    required this.userName,
    required this.password,
  });

  String userName;
  String password;

  factory UserLoginInformation.fromJson(Map<String, dynamic> json) =>
      UserLoginInformation(
          userName: json["UserName"], password: json["Password"]);
  Map<String, dynamic> toJson() => {
        "UserName": userName,
        "Password": password,
      };
}
