import 'dart:convert';
import 'package:movies_app/models/movies_responses.dart';
import 'package:movies_app/repository/similar_movies_repo/similar_movies_repo.dart';
import 'package:http/http.dart' as http;
import '../../constants/constants.dart';

class SimilarMoviesImpl extends SimilarMoviesRepo {
  @override
  Future<MoviesResponse> getSimilarMovies(String id) async {
    Uri url = Uri.https(Constants.baseUrl,
        '${Constants.movieDetails}/$id/similar', {"api_key": Constants.apiKey});
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
    return moviesResponse;
  }
}
