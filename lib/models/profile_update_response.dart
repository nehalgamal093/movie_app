class ProfileUpdateResponse {
  ProfileUpdateResponse({
    List<String>? message,
  }) {
    _message = message;
  }

  ProfileUpdateResponse.fromJson(dynamic json) {
    dynamic messageData = json['message'];
    List<String> messageList = [];

    if (messageData is String) {
      messageList.add(messageData);
    } else if (messageData is List) {
      messageList = messageData.map((e) => e.toString()).toList();
    }
    _message = messageList;
  }
  List<String>? _message;

  ProfileUpdateResponse copyWith({
    List<String>? message,
  }) =>
      ProfileUpdateResponse(
        message: message ?? _message,
      );
  List<String>? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;

    return map;
  }
}
