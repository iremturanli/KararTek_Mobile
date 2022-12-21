class LawyerJudgmentListInformation {
  LawyerJudgmentListInformation(
      {this.id,
      this.commissionId,
      this.courtId,
      this.decree,
      this.decreeType,
      this.meritsYear,
      this.meritsNo,
      this.decreeYear,
      this.decreeNo,
      this.decision,
      this.tbbComments,
      this.likes,
      this.judgmentDate,
      this.createDate,
      this.commissionName,
      this.courtName,
      this.userId,
      this.stateName,
      this.userName,
      this.lastName,
      this.lawyerAssesment,
      this.stateId,
      this.isLike = false});

  int? id;
  int? commissionId;
  int? courtId;
  String? decree;
  String? decreeType;
  String? meritsYear;
  String? meritsNo;
  String? decreeYear;
  String? decreeNo;
  String? decision;
  String? tbbComments;
  int? likes;
  DateTime? judgmentDate;
  DateTime? createDate;
  String? commissionName;
  String? courtName;
  int? userId;
  int? stateId;
  String? stateName;
  String? userName;
  String? lastName;
  String? lawyerAssesment;
  bool? isLike;

  factory LawyerJudgmentListInformation.fromJson(Map<String, dynamic> json) =>
      LawyerJudgmentListInformation(
          id: json["id"],
          commissionId: json["commissionId"],
          courtId: json["courtId"],
          decree: json["decree"],
          decreeType: json["decreeType"],
          meritsYear: json["meritsYear"],
          meritsNo: json["meritsNo"],
          decreeYear: json["decreeYear"],
          decreeNo: json["decreeNo"],
          decision: json["decision"],
          tbbComments: json["tbbComments"],
          likes: json["likes"],
          judgmentDate: DateTime.parse(json["judgmentDate"]),
          createDate: DateTime.parse(json["createDate"]),
          commissionName: json["commissionName"],
          courtName: json["courtName"],
          userId: json["userId"],
          stateName: json["stateName"],
          userName: json["userName"],
          lastName: json["lastName"],
          lawyerAssesment: json["lawyerAssesment"],
          stateId: json["stateId"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "commissionId": commissionId,
        "courtId": courtId,
        "decree": decree,
        "decreeType": decreeType,
        "meritsYear": meritsYear,
        "meritsNo": meritsNo,
        "decreeYear": decreeYear,
        "decreeNo": decreeNo,
        "decision": decision,
        "tbbComments": tbbComments,
        "likes": likes,
        "judgmentDate": judgmentDate,
        "createDate": createDate,
        "commissionName": commissionName,
        "courtName": courtName,
        "userId": userId,
        "stateName": stateName,
        "userName": userName,
        "lastName": lastName,
        "lawyerAssesment": lawyerAssesment,
        "stateId": stateId
      };
}
