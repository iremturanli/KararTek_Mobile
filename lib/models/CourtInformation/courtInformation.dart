class CourtInformation {
  CourtInformation({this.CourtID, this.CourtName, this.CommissionID});

  int? CourtID;
  String? CourtName;
  String? CommissionID;

  factory CourtInformation.fromJson(Map<String, dynamic> json) =>
      CourtInformation(
          CourtID: json["id"],
          CourtName: json["name"],
          CommissionID: json["commissionId"]);

  Map<String, dynamic> toJson() =>
      {"id": CourtID, "name": CourtName, "commissionId": CommissionID};
}
