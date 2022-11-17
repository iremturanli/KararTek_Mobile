class UserRegisterInformation {
  UserRegisterInformation(
      {this.FirstName,
      this.LastName,
      this.UserTypeID,
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

  String? FirstName;
  String? LastName;
  int? UserTypeID;
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

  factory UserRegisterInformation.fromJson(Map<String, dynamic> json) =>
      UserRegisterInformation(
        FirstName: json["FirstName"],
        LastName: json["LastName"],
        IdentityNumber: json["IdentityNumber"],
        PhoneNumber: json["PhoneNumber"],
        Email: json["Email"],
        University: json["University"],
        StudentNumber: json["StudentNumber"],
        Faculty: json["Faculty"],
        Grade: json["Grade"],
        UserTypeID: json['UserTypeId'],
        City: json['City'],
        District: json['District'],
        BarRegisterNo: json['BarRegisterNo'],
      );
  Map<String, dynamic> toJson() => {
        "FirstName": FirstName,
        "LastName": LastName,
        "UserTypeId": UserTypeID,
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
