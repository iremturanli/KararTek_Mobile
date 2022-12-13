class FilterUserStatisticDto {
  FilterUserStatisticDto({
    this.keyword,
    this.id,
    this.userName,
    this.lastName,
    this.cityName,
    this.judgmentCount,
  });

  String? keyword;
  int? id;
  int? judgmentCount;
  String? userName;
  String? lastName;
  String? cityName;

  factory FilterUserStatisticDto.fromJson(Map<String, dynamic> json) =>
      FilterUserStatisticDto(
          keyword: json["keyword"],
          id: json["id"],
          userName: json["userName"],
          lastName: json["lastName"],
          cityName: json["cityName"],
          judgmentCount: json["judgmentCount"]);

  Map<String, dynamic> toJson() => {
        "keyword": keyword,
        "id": id,
        "userName": userName,
        "lastName": lastName,
        "cityName": cityName,
        "judgmentCount": judgmentCount
      };
}
