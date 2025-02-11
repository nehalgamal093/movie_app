class DeleteMovieResponse {
  DeleteMovieResponse({
      String? message,}){
    _message = message;
}

  DeleteMovieResponse.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;
DeleteMovieResponse copyWith({  String? message,
}) => DeleteMovieResponse(  message: message ?? _message,
);
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}