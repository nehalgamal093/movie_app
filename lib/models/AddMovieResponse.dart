class AddMovieResponse {
  AddMovieResponse({
    Data? data,
  }) {
    _data = data;
  }

  AddMovieResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? _data;
  AddMovieResponse copyWith({
    Data? data,
  }) =>
      AddMovieResponse(
        data: data ?? _data,
      );

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    String? movieId,
    String? name,
    num? rating,
    String? imageURL,
    String? year,
  }) {
    _movieId = movieId;
    _name = name;
    _rating = rating;
    _imageURL = imageURL;
    _year = year;
  }

  Data.fromJson(dynamic json) {
    _movieId = json['movieId'];
    _name = json['name'];
    _rating = json['rating'];
    _imageURL = json['imageURL'];
    _year = json['year'];
  }
  String? _movieId;
  String? _name;
  num? _rating;
  String? _imageURL;
  String? _year;
  Data copyWith({
    String? movieId,
    String? name,
    num? rating,
    String? imageURL,
    String? year,
  }) =>
      Data(
        movieId: movieId ?? _movieId,
        name: name ?? _name,
        rating: rating ?? _rating,
        imageURL: imageURL ?? _imageURL,
        year: year ?? _year,
      );
  String? get movieId => _movieId;
  String? get name => _name;
  num? get rating => _rating;
  String? get imageURL => _imageURL;
  String? get year => _year;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movieId'] = _movieId;
    map['name'] = _name;
    map['rating'] = _rating;
    map['imageURL'] = _imageURL;
    map['year'] = _year;
    return map;
  }
}
