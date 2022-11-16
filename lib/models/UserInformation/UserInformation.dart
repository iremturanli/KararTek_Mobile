// ignore_for_file: prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables,file_names,constant_identifier_names
class UserInformation {
  UserInformation(
      {this.Id,
      this.FirstName,
      this.LastName,
      this.UserType,
      this.City,
      this.District,
      this.IdentityNumber,
      this.PhoneNumber,
      this.BarRegisterNo,
      this.Email,
      this.University,
      this.Faculty,
      this.Grade,
      this.StudentNumber});

  int? Id;
  String? FirstName;
  String? LastName;
  String? UserType;
  String? City;
  String? District;
  String? IdentityNumber;
  String? PhoneNumber;
  String? BarRegisterNo;
  String? Email;
  String? University;
  String? Faculty;
  String? Grade;
  String? StudentNumber;

  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      UserInformation(
        Id: json["Id"],
        FirstName: json["FirstName"],
        LastName: json["LastName"],
        IdentityNumber: json["IdentityNumber"],
        PhoneNumber: json["PhoneNumber"],
        Email: json["Email"],
        University: json["University"],
        StudentNumber: json["StudentNumber"],
        Faculty: json["Faculty"],
        Grade: json["Grade"],
        UserType: json['UserType'],
        City: json['City'],
        District: json['District'],
        BarRegisterNo: json['BarRegisterNo'],
      );

  Map<String, dynamic> toJson() => {
        "Id": Id,
        "FirstName": FirstName,
        "LastName": LastName,
        "UserType": UserType,
        "City": City,
        "District": District,
        "IdentityNumber": IdentityNumber,
        "PhoneNumber": PhoneNumber,
        "Email": Email,
        "University": University,
        "Faculty": Faculty,
        "Grade": Grade,
        "StudentNumber": StudentNumber
      };
}
