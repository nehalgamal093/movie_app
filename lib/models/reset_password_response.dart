class ResetPasswordResponse {
  ResetPasswordResponse({
    List<String>? message,
    int? statusCode,
  }) {
    _message = message;
    _statusCode = statusCode;
  }

  ResetPasswordResponse.fromJson(dynamic json) {
    dynamic messageData = json['message'];
    List<String> messageList = [];

    if (messageData is String) {
      messageList.add(messageData);
    } else if (messageData is List) {
      messageList = messageData.map((e) => e.toString()).toList();
    }
    _message = messageList;
    _statusCode = json['statusCode'];
  }
  List<String>? _message;
  int? _statusCode;
  ResetPasswordResponse copyWith({
    List<String>? message,
    int? statusCode,
  }) =>
      ResetPasswordResponse(
        message: message ?? _message,
        statusCode: statusCode ?? _statusCode,
      );
  List<String>? get message => _message;
  int? get statusCode => _statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_statusCode != null) {
      map['statusCode'] = _statusCode;
    }
    return map;
  }
}
