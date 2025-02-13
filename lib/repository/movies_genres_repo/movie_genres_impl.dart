import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/genres_response.dart';
import 'package:movies_app/models/movies_responses.dart';
import 'package:movies_app/repository/movies_genres_repo/movie_genres_repo.dart';
import '../../constants/constants.dart';

class MovieGenresImpl extends MovieGenresRepo {
  @override
  Future<GenresResponse> getGenres() async {
    Uri url = Uri.https(Constants.baseUrl, Constants.genresEndPoint, {
      "api_key": Constants.apiKey,
    });

    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    GenresResponse genresResponse = GenresResponse.fromJson(json);
    return genresResponse;
  }

  @override
  Future<MoviesResponse> getMovies(String id) async {
    Uri url = Uri.https(Constants.baseUrl, Constants.movie,
        {"api_key": Constants.apiKey, 'with_genres': id});
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
    return moviesResponse;
  }
}
