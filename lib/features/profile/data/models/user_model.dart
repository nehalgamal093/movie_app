class Data {
  String? id;
  String? email;
  String? password;
  String? name;
  String? phone;
  num? avaterId;
  String? createdAt;
  String? updatedAt;
  num? v;

  Data(
      {this.id, this.email, this.password, this.name, this.phone, this.avaterId, this.createdAt, this.updatedAt, this.v});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["_id"] = id;
    map["email"] = email;
    map["password"] = password;
    map["name"] = name;
    map["phone"] = phone;
    map["avaterId"] = avaterId;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["__v"] = v;
    return map;
  }

  Data.fromJson(dynamic json){
    id = json["_id"];
    email = json["email"];
    password = json["password"];
    name = json["name"];
    phone = json["phone"];
    avaterId = json["avaterId"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }
}

class UserModel {
  String? message;
  Data? data;

  UserModel({this.message, this.data});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["message"] = message;
    if (data != null) {
      map["data"] = data?.toJson();
    }
    return map;
  }

  UserModel.fromJson(dynamic json){
    message = json["message"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

}