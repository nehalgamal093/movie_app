import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/movies_responses.dart';
import 'package:movies_app/repository/search_movie_repo/search_movie_repo.dart';

import '../../constants/constants.dart';

class SearchMovieImpl extends SearchMovieRepo {
  @override
  Future<MoviesResponse> getSearchedMovies(String keyword) async {
    Uri url = Uri.https(Constants.baseUrl, Constants.searchMovie,
        {"api_key": Constants.apiKey, 'query': keyword});
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    MoviesResponse moviesResponse = MoviesResponse.fromJson(json);
    return moviesResponse;
  }
}
