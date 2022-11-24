class CityInformation {
  CityInformation({
    this.CityID,
    this.CityName,
  });

  int? CityID;
  String? CityName;

  factory CityInformation.fromJson(Map<String, dynamic> json) =>
      CityInformation(CityID: json["id"], CityName: json["name"]);

  Map<String, dynamic> toJson() => {
        "id": CityID,
        "name": CityName,
      };
}
