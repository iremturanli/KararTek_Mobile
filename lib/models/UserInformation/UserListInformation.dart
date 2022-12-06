class UserListInformation {
  UserListInformation({
    this.firstName,
    this.lastName,
    this.userTypeId,
    this.cityId,
    this.districtId,
    this.id,
    this.cityName,
    this.districtName,
    this.identityNumber,
    this.phoneNumber,
    this.barRegisterNo,
    this.email,
    this.university,
    this.faculty,
    this.grade,
    this.studentNumber,
    this.userTypeName,
  });

  String? firstName;
  String? lastName;
  int? userTypeId;
  int? cityId;
  int? districtId;
  int? id;
  String? cityName;
  String? districtName;
  String? identityNumber;
  String? phoneNumber;
  String? barRegisterNo;
  String? email;
  String? university;
  String? faculty;
  String? grade;
  String? studentNumber;
  String? userTypeName;

  factory UserListInformation.fromJson(Map<String, dynamic> json) =>
      UserListInformation(
        firstName: json["firstName"],
        lastName: json["lastName"],
        userTypeId: json["userTypeId"],
        cityId: json["cityId"],
        districtId: json["districtId"],
        id: json["id"],
        cityName: json["cityName"],
        districtName: json["districtName"],
        identityNumber: json["identityNumber"],
        phoneNumber: json["phoneNumber"],
        barRegisterNo: json["barRegisterNo"],
        email: json["email"],
        university: json["university"],
        faculty: json["faculty"],
        grade: json["grade"],
        studentNumber: json["studentNumber"],
        userTypeName: json["userTypeName"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "userTypeId": userTypeId,
        "cityId": cityId,
        "districtId": districtId,
        "id": id,
        "cityName": cityName,
        "districtName": districtName,
        "identityNumber": identityNumber,
        "phoneNumber": phoneNumber,
        "barRegisterNo": barRegisterNo,
        "email": email,
        "university": university,
        "faculty": faculty,
        "grade": grade,
        "studentNumber": studentNumber,
        "userTypeName": userTypeName,
      };
}
