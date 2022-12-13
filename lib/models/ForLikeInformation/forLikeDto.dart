// ignore_for_file:  file_names, avoid_print,prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables

class ForLikeDto {
  ForLikeDto({
    required this.userId,
    required this.searchTypeId,
  });

  int? userId;
  int? searchTypeId;

  factory ForLikeDto.fromJson(Map<String, dynamic> json) =>
      ForLikeDto(userId: json["userId"], searchTypeId: json["searchTypeId"]);
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "searchTypeId": searchTypeId,
      };
}
