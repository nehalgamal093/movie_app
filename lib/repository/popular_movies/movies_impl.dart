import 'dart:convert';
import 'package:movies_app/models/movies_responses.dart';
import 'package:movies_app/repository/popular_movies/movies_repo.dart';
import 'package:http/http.dart' as http;
import '../../constants/constants.dart';

class PopularMoviesImpl implements PopularMoviesRepo {
  @override
  Future<MoviesResponse> getPopularMovies() async {
    Uri url = Uri.https(Constants.baseUrl, Constants.popularMovieEndPoint, {
      "api_key": Constants.apiKey,
    });

    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    MoviesResponse moviesResponse = MoviesResponse.fromJson(json);

    return moviesResponse;
  }

  @override
  Future<MoviesResponse> getTopRatedMovies() async{
    Uri url = Uri.https(Constants.baseUrl, Constants.topRatedEndPoint, {
      "api_key": Constants.apiKey,
    });

    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    MoviesResponse moviesResponse = MoviesResponse.fromJson(json);

    return moviesResponse;
  }
}
