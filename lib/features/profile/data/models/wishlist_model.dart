class Data {
  String? movieId;
  String? name;
  num? rating;
  String? imageURL;
  String? year;

  Data({this.movieId, this.name, this.rating, this.imageURL, this.year});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["movieId"] = movieId;
    map["name"] = name;
    map["rating"] = rating;
    map["imageURL"] = imageURL;
    map["year"] = year;
    return map;
  }

  Data.fromJson(dynamic json){
    movieId = json["movieId"];
    name = json["name"];
    rating = json["rating"];
    imageURL = json["imageURL"];
    year = json["year"];
  }
}

class WishlistModel {
  String? message;
  List<Data>? dataList;

  WishlistModel({this.message, this.dataList});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["message"] = message;
    if (dataList != null) {
      map["data"] = dataList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  WishlistModel.fromJson(dynamic json){
    message = json["message"];
    if (json["data"] != null) {
      dataList = [];
      json["data"].forEach((v) {
        dataList?.add(Data.fromJson(v));
      });
    }
  }
}