class JudgmentInformation {
  JudgmentInformation({
    this.judgmentTypeId,
    this.commissionId,
    this.courtId,
    this.decree,
    this.decreeType,
    this.meritsYear,
    this.meritsNo,
    this.decreeYear,
    this.decreeNo,
    this.decision,
    this.likes,
    this.judgmentDate,
    this.id,
    this.createDate,
    this.isDeleted,
  });

  int? judgmentTypeId;
  int? commissionId;
  int? courtId;
  String? decree;
  String? decreeType;
  String? meritsYear;
  String? meritsNo;
  String? decreeYear;
  String? decreeNo;
  String? decision;
  int? likes;
  DateTime? judgmentDate;
  int? id;
  DateTime? createDate;
  bool? isDeleted;

  factory JudgmentInformation.fromJson(Map<String, dynamic> json) =>
      JudgmentInformation(
        judgmentTypeId: json["judgmentTypeId"],
        commissionId: json["commissionId"],
        courtId: json["courtId"],
        decree: json["decree"],
        decreeType: json["decreeType"],
        meritsYear: json["meritsYear"],
        meritsNo: json["meritsNo"],
        decreeYear: json["decreeYear"],
        decreeNo: json["decreeNo"],
        decision: json["decision"],
        likes: json["likes"],
        judgmentDate: DateTime.parse(json["judgmentDate"]),
        id: json["id"],
        createDate: DateTime.parse(json["createDate"]),
        isDeleted: json["isDeleted"],
      );

  Map<String, dynamic> toJson() => {
        "judgmentTypeId": judgmentTypeId,
        "commissionId": commissionId,
        "courtId": courtId,
        "decree": decree,
        "decreeType": decreeType,
        "meritsYear": meritsYear,
        "meritsNo": meritsNo,
        "decreeYear": decreeYear,
        "decreeNo": decreeNo,
        "decision": decision,
        "likes": likes,
        "judgmentDate": judgmentDate?.toIso8601String(),
        "id": id,
        "createDate": createDate?.toIso8601String()
      };
}
