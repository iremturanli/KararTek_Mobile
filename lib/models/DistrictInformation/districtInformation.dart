class DistrictInformation {
  DistrictInformation({
    this.DistrictID,
    this.DistrictName,
  });

  int? DistrictID;
  String? DistrictName;

  factory DistrictInformation.fromJson(Map<String, dynamic> json) =>
      DistrictInformation(
        DistrictID: json["id"],
        DistrictName: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": DistrictID,
        "name": DistrictName,
      };
}
