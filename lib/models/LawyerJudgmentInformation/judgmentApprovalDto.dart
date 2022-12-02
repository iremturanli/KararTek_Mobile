import 'package:flutter_application_1/models/SearchTypeInformation/searchTypeInformation.dart';

class ApproveJudgmentDto {
  ApproveJudgmentDto({
    required this.id,
    required this.stateId,
    this.rejectMessage,
  });

  String? rejectMessage;
  int? id;
  int? stateId;

  factory ApproveJudgmentDto.fromJson(Map<String, dynamic> json) =>
      ApproveJudgmentDto(
          id: json["id"],
          stateId: json["stateId"],
          rejectMessage: json["rejectMessage"]);
  Map<String, dynamic> toJson() =>
      {"id": id, "stateId": stateId, "rejectMessage": rejectMessage};
}
