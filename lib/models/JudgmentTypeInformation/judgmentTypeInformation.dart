class JudgmentTypeInformation {
  JudgmentTypeInformation({
    this.JudgmentTypeID,
    this.JudgmentTypeName,
  });

  int? JudgmentTypeID;
  String? JudgmentTypeName;

  factory JudgmentTypeInformation.fromJson(Map<String, dynamic> json) =>
      JudgmentTypeInformation(
          JudgmentTypeID: json["id"], JudgmentTypeName: json["name"]);

  Map<String, dynamic> toJson() => {
        "id": JudgmentTypeID,
        "name": JudgmentTypeName,
      };
}
