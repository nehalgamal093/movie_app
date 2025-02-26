class RegisterResponse {
  RegisterResponse({
    List<String>? message,
    Data? data,
  }) {
    _message = message;
    _data = data;
  }

  RegisterResponse.fromJson(dynamic json) {
    dynamic messageData = json['message'];
    List<String> messageList = [];

    if (messageData is String) {
      messageList.add(messageData);
    } else if (messageData is List) {
      messageList = messageData.map((e) => e.toString()).toList();
    }
    _message = messageList;
    _data = json['datasource'] != null ? Data.fromJson(json['datasource']) : null;
  }
  List<String>? _message;
  Data? _data;
  RegisterResponse copyWith({
    List<String>? message,
    Data? data,
  }) =>
      RegisterResponse(
        message: message ?? _message,
        data: data ?? _data,
      );
  List<String>? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['datasource'] = _data?.toJson();
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
    num? avaterId,
    String? id,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) {
    _email = email;
    _password = password;
    _name = name;
    _phone = phone;
    _avaterId = avaterId;
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
    _avaterId = json['avaterId'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _email;
  String? _password;
  String? _name;
  String? _phone;
  num? _avaterId;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
  Data copyWith({
    String? email,
    String? password,
    String? name,
    String? phone,
    num? avaterId,
    String? id,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) =>
      Data(
        email: email ?? _email,
        password: password ?? _password,
        name: name ?? _name,
        phone: phone ?? _phone,
        avaterId: avaterId ?? _avaterId,
        id: id ?? _id,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
      );
  String? get email => _email;
  String? get password => _password;
  String? get name => _name;
  String? get phone => _phone;
  num? get avaterId => _avaterId;
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
    map['avaterId'] = _avaterId;
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}
