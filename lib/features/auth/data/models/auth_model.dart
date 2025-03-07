
class AuthModel {
  AuthModel({
    num? statusCode,
      String? message, 
      Data? data,}){
    _message = message;
    _data = data;
    _statusCode = statusCode;
}

  AuthModel.fromJson(dynamic json) {
    _statusCode = json['statusCode'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _statusCode;
  String? _message;
  Data? _data;
AuthModel copyWith({num? statusCode, String? message,
  Data? data,
}) => AuthModel( statusCode: statusCode ?? _statusCode, message: message ?? _message,
  data: data ?? _data,
);
  String? get message => _message;
  Data? get data => _data;
  num? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['statusCode'] = _statusCode;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      String? email, 
      String? password, 
      String? name, 
      String? phone, 
      num? avatarId,
      String? id, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _email = email;
    _password = password;
    _name = name;
    _phone = phone;
    _avatarId = avatarId;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Data.fromJson(dynamic json) {
    _email = json['email'];
    _password = json['password'];
    _name = json['name'];
    _phone = json['phone'];
    _avatarId = json['avaterId'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _email;
  String? _password;
  String? _name;
  String? _phone;
  num? _avatarId;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
Data copyWith({  String? email,
  String? password,
  String? name,
  String? phone,
  num? avatarId,
  String? id,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => Data(  email: email ?? _email,
  password: password ?? _password,
  name: name ?? _name,
  phone: phone ?? _phone,
  avatarId: avatarId ?? _avatarId,
  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  String? get email => _email;
  String? get password => _password;
  String? get name => _name;
  String? get phone => _phone;
  num? get avatarId => _avatarId;
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['password'] = _password;
    map['name'] = _name;
    map['phone'] = _phone;
    map['avaterId'] = _avatarId;
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}