class IsMovieFavorite {
  IsMovieFavorite({
    String? message,
    bool? data,
  }) {
    _message = message;
    _data = data;
  }

  IsMovieFavorite.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['datasource'];
  }
  String? _message;
  bool? _data;
  IsMovieFavorite copyWith({
    String? message,
    bool? data,
  }) =>
      IsMovieFavorite(
        message: message ?? _message,
        data: data ?? _data,
      );
  String? get message => _message;
  bool? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['datasource'] = _data;
    return map;
  }
}
