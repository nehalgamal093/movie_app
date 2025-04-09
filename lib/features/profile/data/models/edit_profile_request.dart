class EditProfileRequest {
  String? email;
  num? avaterId;
  String? phone;

  EditProfileRequest({this.email, this.avaterId, this.phone});

  String? get email_ => email;
  num? get avaterId_ => avaterId;
  String? get phone_ => phone;

  void setEmail(String email) {
    this.email = email;
  }

  void setAvaterId(num avaterId) {
    this.avaterId = avaterId;
  }

  void setPhone(String phone) {
    this.phone = phone;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["email"] = email;
    map["avaterId"] = avaterId;
    map["phone"] = phone;
    return map;
  }

  EditProfileRequest.fromJson(dynamic json) {
    email = json["email"];
    avaterId = json["avaterId"];
    phone = json["phone"];
  }
}
