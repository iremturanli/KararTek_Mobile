// ignore_for_file: prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables,file_names,constant_identifier_names
class UserInformation {
  UserInformation({
    this.id,
    this.name,
    this.lastName,
    this.identityNumber,
    this.telephoneNumber,
    this.email,
    this.schoolName,
    this.studentNumber,
    this.department,
    this.token,
  });

  int? id;
  String? name;
  String? lastName;
  String? identityNumber;
  String? telephoneNumber;
  String? email;
  String? schoolName;
  String? studentNumber;
  String? department;
  String? token;

  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      UserInformation(
        id: json["id"],
        name: json["name"],
        lastName: json["lastName"],
        identityNumber: json["identityNumber"],
        telephoneNumber: json["telephoneNumber"],
        email: json["email"],
        schoolName: json["schoolName"],
        studentNumber: json["studentNumber"],
        department: json["department"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastName": lastName,
        "identityNumber": identityNumber,
        "telephoneNumber": telephoneNumber,
        "email": email,
        "schoolName": schoolName,
        "studentNumber": studentNumber,
        "department": department,
        "token": token,
      };
}
