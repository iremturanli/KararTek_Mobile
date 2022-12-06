class UserStatisticInformation {
  UserStatisticInformation({
    this.id,
    this.userName,
    this.lastName,
    this.cityName,
    this.judgmentCount,
  });

  int? id;
  int? judgmentCount;
  String? userName;
  String? lastName;
  String? cityName;

  factory UserStatisticInformation.fromJson(Map<String, dynamic> json) =>
      UserStatisticInformation(
          id: json["id"],
          userName: json["userName"],
          lastName: json["lastName"],
          cityName: json["cityName"],
          judgmentCount: json["judgmentCount"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "lastName": lastName,
        "cityName": cityName,
        "judgmentCount": judgmentCount
      };
}
