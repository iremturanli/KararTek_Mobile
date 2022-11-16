// ignore_for_file:  file_names, avoid_print,prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables

class UserLoginInformation {
  UserLoginInformation({
    required this.identityNumber,
    required this.password,
  });

  String identityNumber;
  String password;

  factory UserLoginInformation.fromJson(Map<String, dynamic> json) =>
      UserLoginInformation(
          identityNumber: json["identityNumber"], password: json["password"]);
  Map<String, dynamic> toJson() => {
        "identityNumber": identityNumber,
        "password": password,
      };
}
