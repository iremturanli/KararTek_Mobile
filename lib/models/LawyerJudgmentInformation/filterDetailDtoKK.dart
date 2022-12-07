// ignore_for_file: file_names, camel_case_types

class FilterDetailDtoKK {
  FilterDetailDtoKK({
    this.decree,
    this.meritsNo,
    this.decreeNo,
    this.decision,
    this.judgmentStateId,
    this.lawyerAssesment,
    this.startDate,
    this.finishDate,
  });

  String? decree;

  String? meritsNo;

  String? decreeNo;

  String? decision;
  int? judgmentStateId;
  String? lawyerAssesment;
  DateTime? startDate;
  DateTime? finishDate;

  factory FilterDetailDtoKK.fromJson(Map<String, dynamic> json) =>
      FilterDetailDtoKK(
          decree: json["decree"],
          decision: json["decision"],
          judgmentStateId: json["judgmentStateId"],
          lawyerAssesment: json["lawyerAssesment"],
          startDate: DateTime.parse(json["startDate"]),
          finishDate: DateTime.parse(json["finishDate"]));
  Map<String, dynamic> toJson() => {
        "decree": decree,
        "decision": decision,
        "judgmentStateId": judgmentStateId,
        "lawyerAssesment": lawyerAssesment,
        "startDate": startDate?.toIso8601String(),
        "finishDate": finishDate?.toIso8601String(),
      };
}
