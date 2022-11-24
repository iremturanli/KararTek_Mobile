// ignore_for_file: non_constant_identifier_names

class UserRegisterInformation {
  UserRegisterInformation({
    this.firstName,
    this.lastName,
    this.userTypeId,
    this.cityId,
    this.districtId,
    this.identityNumber,
    this.phoneNumber,
    this.barRegisterNo,
    this.email,
  });

  String? firstName;
  String? lastName;
  int? userTypeId;
  int? cityId;
  int? districtId;
  String? identityNumber;
  String? phoneNumber;
  String? barRegisterNo;
  String? email;

  factory UserRegisterInformation.fromJson(Map<String, dynamic> json) =>
      UserRegisterInformation(
        firstName: json["firstName"],
        lastName: json["lastName"],
        userTypeId: json["userTypeId"],
        cityId: json["cityId"],
        districtId: json["districtId"],
        identityNumber: json["identityNumber"],
        phoneNumber: json["phoneNumber"],
        barRegisterNo: json["barRegisterNo"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "userTypeId": userTypeId,
        "cityId": cityId,
        "districtId": districtId,
        "identityNumber": identityNumber,
        "phoneNumber": phoneNumber,
        "barRegisterNo": barRegisterNo,
        "email": email,
      };
}
