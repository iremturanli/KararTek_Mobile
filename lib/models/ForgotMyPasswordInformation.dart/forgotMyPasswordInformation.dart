// ignore_for_file:  file_names, avoid_print,prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables

class ForgotMyPasswordInformation {
  ForgotMyPasswordInformation({
    this.identityNumber,
    this.email,
  });

  String? identityNumber;
  String? email;

  factory ForgotMyPasswordInformation.fromJson(Map<String, dynamic> json) =>
      ForgotMyPasswordInformation(
          identityNumber: json["identityNumber"], email: json["email"]);

  Map<String, dynamic> toJson() => {
        "identityNumber": identityNumber,
        "email": email,
      };
}
