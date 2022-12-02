class LawyerJudgmentAddDto {
  LawyerJudgmentAddDto({
    this.commissionId,
    this.courtId,
    this.decree,
    this.decreeType,
    this.meritsYear,
    this.meritsNo,
    this.decreeYear,
    this.decreeNo,
    this.decision,
    this.judgmentDate,
    this.lawyerAssessment,
  });

  int? commissionId;
  int? courtId;
  String? decree;
  String? decreeType;
  String? meritsYear;
  String? meritsNo;
  String? decreeYear;
  String? decreeNo;
  String? decision;
  DateTime? judgmentDate;
  String? lawyerAssessment;

  factory LawyerJudgmentAddDto.fromJson(Map<String, dynamic> json) =>
      LawyerJudgmentAddDto(
        commissionId: json["commissionId"],
        courtId: json["courtId"],
        decree: json["decree"],
        decreeType: json["decreeType"],
        meritsYear: json["meritsYear"],
        meritsNo: json["meritsNo"],
        decreeYear: json["decreeYear"],
        decreeNo: json["decreeNo"],
        decision: json["decision"],
        judgmentDate: DateTime.parse(json["judgmentDate"]),
        lawyerAssessment: json["lawyerAssessment"],
      );

  Map<String, dynamic> toJson() => {
        "commissionId": commissionId,
        "courtId": courtId,
        "decree": decree,
        "decreeType": decreeType,
        "meritsYear": meritsYear,
        "meritsNo": meritsNo,
        "decreeYear": decreeYear,
        "decreeNo": decreeNo,
        "decision": decision,
        "judgmentDate": judgmentDate?.toIso8601String(),
        "lawyerAssessment": lawyerAssessment,
      };
}
