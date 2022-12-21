class JudgmentListInformation {
  JudgmentListInformation({
    this.judgmentTypeId,
    this.judgmentTypeName,
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
    this.commissionName,
    this.courtName,
    this.id,
    this.createDate,
  });

  int? judgmentTypeId;
  String? judgmentTypeName;
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
  String? courtName;
  String? commissionName;

  factory JudgmentListInformation.fromJson(Map<String, dynamic> json) =>
      JudgmentListInformation(
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
        judgmentTypeName: json["judgmentTypeName"],
        courtName: json["courtName"],
        commissionName: json["commissionName"],
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
        "createDate": createDate?.toIso8601String(),
        "judgmentTypeName": judgmentTypeName,
        "courtName": courtName,
        "commissionName": commissionName
      };
}
