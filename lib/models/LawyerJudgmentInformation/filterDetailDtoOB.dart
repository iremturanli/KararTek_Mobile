class FilterDetailDtoOb {
  FilterDetailDtoOb({
    this.decree,
    this.meritsNo,
    this.decreeNo,
    this.decision,
    this.lawyerAssesment,
    this.startDate,
    this.finishDate,
  });

  String? decree;
  String? meritsNo;
  String? decreeNo;
  String? decision;
  String? lawyerAssesment;
  DateTime? startDate;
  DateTime? finishDate;

  factory FilterDetailDtoOb.fromJson(Map<String, dynamic> json) =>
      FilterDetailDtoOb(
        decree: json["decree"],
        meritsNo: json["meritsNo"],
        decreeNo: json["decreeNo"],
        decision: json["decision"],
        lawyerAssesment: json["lawyerAssesment"],
        startDate: DateTime.parse(json["startDate"]),
        finishDate: DateTime.parse(json["finishDate"]),
      );

  Map<String, dynamic> toJson() => {
        "decree": decree,
        "meritsNo": meritsNo,
        "decreeNo": decreeNo,
        "decision": decision,
        "lawyerAssesment": lawyerAssesment,
        "startDate": startDate?.toIso8601String(),
        "finishDate": finishDate?.toIso8601String(),
      };
}
