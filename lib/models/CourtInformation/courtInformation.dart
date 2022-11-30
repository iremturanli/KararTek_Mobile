class CourtInformation {
  CourtInformation({
    this.CourtID,
    this.CourtName,
  });

  int? CourtID;
  String? CourtName;

  factory CourtInformation.fromJson(Map<String, dynamic> json) =>
      CourtInformation(
        CourtID: json["id"],
        CourtName: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": CourtID,
        "name": CourtName,
      };
}
