import 'dart:convert';

import 'package:movies_app/models/MovieImages.dart';
import 'package:movies_app/repository/movie_images_repo/movie_images_repo.dart';
import 'package:http/http.dart' as http;
import '../../constants/constants.dart';

class MovieImagesImpl extends MovieImagesRepo{
  @override
  Future<MovieImages> getMovieImages(String id) async{
    Uri url = Uri.https(Constants.baseUrl, '${Constants.movieDetails}/$id/images',
        {"api_key": Constants.apiKey});

    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    MovieImages movieImages =
    MovieImages.fromJson(json);
    return movieImages;
  }

}