class ResetPasswordRequest {
  String? oldPassword;
  String? newPassword;

  ResetPasswordRequest({this.oldPassword, this.newPassword});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["oldPassword"] = oldPassword;
    map["newPassword"] = newPassword;
    return map;
  }

  ResetPasswordRequest.fromJson(dynamic json){
    oldPassword = json["oldPassword"];
    newPassword = json["newPassword"];
  }
  void setOldPassword(String oldPassword){
    this.oldPassword = oldPassword;
  }
  void setNewPassword(String newPassword){
    this.newPassword = newPassword;
  }
}