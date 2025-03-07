

class RegisterRequestModel {
  RegisterRequestModel({
      String? name, 
      String? email, 
      String? password, 
      String? confirmPassword, 
      String? phone, 
      num? avatarId,}){
    _name = name;
    _email = email;
    _password = password;
    _confirmPassword = confirmPassword;
    _phone = phone;
    _avatarId = avatarId;
}

  RegisterRequestModel.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _confirmPassword = json['confirmPassword'];
    _phone = json['phone'];
    _avatarId = json['avaterId'];
  }
  String? _name;
  String? _email;
  String? _password;
  String? _confirmPassword;
  String? _phone;
  num? _avatarId;
RegisterRequestModel copyWith({  String? name,
  String? email,
  String? password,
  String? confirmPassword,
  String? phone,
  num? avatarId,
}) => RegisterRequestModel(  name: name ?? _name,
  email: email ?? _email,
  password: password ?? _password,
  confirmPassword: confirmPassword ?? _confirmPassword,
  phone: phone ?? _phone,
  avatarId: avatarId ?? _avatarId,
);
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  String? get confirmPassword => _confirmPassword;
  String? get phone => _phone;
  num? get avatarId => _avatarId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['confirmPassword'] = _confirmPassword;
    map['phone'] = _phone;
    map['avaterId'] = _avatarId;
    return map;
  }

}