
class FavoriteMovies {
  FavoriteMovies({
      String? message, 
      List<Data>? data,}){
    _message = message;
    _data = data;
}

  FavoriteMovies.fromJson(dynamic json) {
    _message = json['message'];
    if (json['datasource'] != null) {
      _data = [];
      json['datasource'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _message;
  List<Data>? _data;
FavoriteMovies copyWith({  String? message,
  List<Data>? data,
}) => FavoriteMovies(  message: message ?? _message,
  data: data ?? _data,
);
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['datasource'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// movieId : "412272"
/// name : "Back to the 2015 Future"
/// rating : 6.8
/// imageURL : "/eePBrF9RnTajSPEeRzIsdGUObJE.jpg"
/// year : "2015"

class Data {
  Data({
      String? movieId, 
      String? name, 
      num? rating, 
      String? imageURL, 
      String? year,}){
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
Data copyWith({  String? movieId,
  String? name,
  num? rating,
  String? imageURL,
  String? year,
}) => Data(  movieId: movieId ?? _movieId,
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