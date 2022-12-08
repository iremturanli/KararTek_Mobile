class UserChangePasswordInformation {
  UserChangePasswordInformation({
    this.currentPassword,
    this.newPassword,
  });

  String? currentPassword;
  String? newPassword;

  factory UserChangePasswordInformation.fromJson(Map<String, dynamic> json) =>
      UserChangePasswordInformation(
        currentPassword: json["currentPassword"],
        newPassword: json["newPassword"],
      );

  Map<String, dynamic> toJson() => {
        "currentPassword": currentPassword,
        "newPassword": newPassword,
      };
}
