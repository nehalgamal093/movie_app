class LoginModel {
  LoginModel({
    String? message,
    String? data,
  }) {
    _message = message;
    _data = data;
  }

  LoginModel.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'];
  }
  String? _message;
  String? _data;
  LoginModel copyWith({
    String? message,
    String? data,
  }) =>
      LoginModel(
        message: message ?? _message,
        data: data ?? _data,
      );
  String? get message => _message;
  String? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['data'] = _data;
    return map;
  }
}
