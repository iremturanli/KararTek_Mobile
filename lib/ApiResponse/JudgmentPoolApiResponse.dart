import 'package:flutter_application_1/ApiResponse/SearchDataLawyerResponse.dart';
import 'package:flutter_application_1/models/JudgmentInformation/judgmentListInformation.dart';
import 'package:flutter_application_1/models/LawyerJudgmentInformation/lawyerJudgmentListInformation.dart';

class JudgmentPoolApiResponse {
  JudgmentPoolApiResponse({
    this.userId,
    this.judgmentResponseListDto,
    this.lawyerJudgmentResponseListDto,
  });

  int? userId;
  List<JudgmentListInformation>? judgmentResponseListDto;
  List<LawyerJudgmentListInformation>? lawyerJudgmentResponseListDto;

  factory JudgmentPoolApiResponse.fromJson(Map<String, dynamic> json) =>
      JudgmentPoolApiResponse(
        userId: json["userId"],
        judgmentResponseListDto: List<JudgmentListInformation>.from(
            json["judgmentResponseListDto"]
                .map((x) => JudgmentListInformation.fromJson(x))),
        lawyerJudgmentResponseListDto: List<LawyerJudgmentListInformation>.from(
            json["lawyerJudgmentResponseListDto"]
                .map((x) => LawyerJudgmentListInformation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "judgmentResponseListDto":
            List<dynamic>.from(judgmentResponseListDto!.map((x) => x.toJson())),
        "lawyerJudgmentResponseListDto": List<dynamic>.from(
            lawyerJudgmentResponseListDto!.map((x) => x.toJson())),
      };
}
