class CommissionInformation {
  CommissionInformation({
    this.CommissionID,
    this.CommissionName,
  });

  int? CommissionID;
  String? CommissionName;

  factory CommissionInformation.fromJson(Map<String, dynamic> json) =>
      CommissionInformation(
          CommissionID: json["id"], CommissionName: json["name"]);

  Map<String, dynamic> toJson() => {
        "id": CommissionID,
        "name": CommissionName,
      };
}
