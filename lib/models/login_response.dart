class LoginResponse {
  LoginResponse({
    List<String>? message,
    String? data,
  }) {
    _message = message;
    _data = data;
  }

  LoginResponse.fromJson(dynamic json) {
    dynamic messageData = json['message'];
    List<String> messageList = [];

    if (messageData is String) {
      messageList.add(messageData);
    } else if (messageData is List) {
      messageList = messageData.map((e) => e.toString()).toList();
    }
    _message = messageList;
    _data = json['datasource'];
  }
  List<String>? _message;
  String? _data;
  LoginResponse copyWith({
    List<String>? message,
    String? data,
  }) =>
      LoginResponse(
        message: message ?? _message,
        data: data ?? _data,
      );
  List<String>? get message => _message;
  String? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['datasource'] = _data;
    }
    return map;
  }
}

