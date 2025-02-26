
class GenresModel {
  GenresModel({
    List<Genres>? genres,}){
    _genres = genres;
  }

  GenresModel.fromJson(dynamic json) {
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(Genres.fromJson(v));
      });
    }
  }
  List<Genres>? _genres;
  GenresModel copyWith({  List<Genres>? genres,
  }) => GenresModel(genres: genres ?? _genres,
  );
  List<Genres>? get genres => _genres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_genres != null) {
      map['genres'] = _genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class Genres {
  Genres({
    num? id,
    String? name,}){
    _id = id;
    _name = name;
  }

  Genres.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
  Genres copyWith({  num? id,
    String? name,
  }) => Genres(  id: id ?? _id,
    name: name ?? _name,
  );
  num? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}