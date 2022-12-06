class JudgmentStateInformation {
  JudgmentStateInformation({
    this.StateId,
    this.StateName,
  });

  int? StateId;
  String? StateName;

  factory JudgmentStateInformation.fromJson(Map<String, dynamic> json) =>
      JudgmentStateInformation(
          StateId: json["stateId"], StateName: json["stateName"]);

  Map<String, dynamic> toJson() => {
        "stateId": StateId,
        "stateName": StateName,
      };
}
