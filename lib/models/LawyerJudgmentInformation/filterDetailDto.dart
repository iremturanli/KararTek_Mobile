// ignore_for_file: file_names, camel_case_types

class FilterDetailDto {
  FilterDetailDto({
    this.judgmentTypeId,
    this.commisionName,
    this.court,
    this.decree,
    this.decreeType,
    this.meritsYear,
    this.meritsNoFirst,
    this.meritsNoLast,
    this.decreeYear,
    this.decreeNoFirst,
    this.decreeNoLast,
    this.decision,
    this.judgmentStateId,
    this.lawyerAssesment,
    this.startDate,
    this.finishDate,
  });

  int? judgmentTypeId;
  String? commisionName;
  String? court;
  String? decree;
  String? decreeType;
  String? meritsYear;
  String? meritsNoFirst;
  String? meritsNoLast;
  String? decreeYear;
  String? decreeNoFirst;
  String? decreeNoLast;
  String? decision;
  int? judgmentStateId;
  String? lawyerAssesment;
  DateTime? startDate;
  DateTime? finishDate;

  factory FilterDetailDto.fromJson(Map<String, dynamic> json) =>
      FilterDetailDto(
          judgmentTypeId: json["judgmentTypeId"],
          commisionName: json["commisionName"],
          court: json["court"],
          decree: json["decree"],
          decreeType: json["decreeType"],
          meritsYear: json["meritsYear"],
          meritsNoFirst: json["meritsNoFirst"],
          meritsNoLast: json["meritsNoLast"],
          decreeYear: json["decreeYear"],
          decreeNoFirst: json["decreeNoFirst"],
          decreeNoLast: json["decreeNoLast"],
          decision: json["decision"],
          judgmentStateId: json["judgmentStateId"],
          lawyerAssesment: json["lawyerAssesment"],
          startDate: DateTime.parse(json["startDate"]),
          finishDate: DateTime.parse(json["finishDate"]));
  Map<String, dynamic> toJson() => {
        "judgmentTypeId": judgmentTypeId,
        "commisionName": commisionName,
        "court": court,
        "decree": decree,
        "decreeType": decreeType,
        "meritsYear": meritsYear,
        "meritsNoFirst": meritsNoFirst,
        "meritsNoLast": meritsNoLast,
        "decreeYear": decreeYear,
        "decreeNoFirst": decreeNoFirst,
        "decreeNoLast": decreeNoLast,
        "decision": decision,
        "judgmentStateId": judgmentStateId,
        "lawyerAssesment": lawyerAssesment,
        "startDate": startDate?.toIso8601String(),
        "finishDate": finishDate?.toIso8601String(),
      };
}
