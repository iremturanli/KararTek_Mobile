class ForLikeList {
  ForLikeList({
    this.judgmentId,
    this.isLike,
  });

  int? judgmentId;
  bool? isLike;

  factory ForLikeList.fromJson(Map<String, dynamic> json) => ForLikeList(
        judgmentId: json["judgmentId"],
        isLike: json["isLike"],
      );

  Map<String, dynamic> toJson() => {
        "judgmenId": judgmentId,
        "isLike": isLike,
      };
}
