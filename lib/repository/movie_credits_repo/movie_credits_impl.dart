import 'dart:convert';
import 'package:movies_app/models/MovieCreditsResponse.dart';
import 'package:movies_app/repository/movie_credits_repo/movie_credits_repo.dart';
import 'package:http/http.dart' as http;
import '../../constants/constants.dart';

class MovieCreditsImpl extends MovieCreditsRepo {
  @override
  Future<MovieCreditsResponse> getCredits(String id) async {
    Uri url = Uri.https(Constants.baseUrl,
        '${Constants.movieDetails}/$id/credits', {"api_key": Constants.apiKey});

    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    MovieCreditsResponse movieCreditsResponse =
        MovieCreditsResponse.fromJson(json);
    return movieCreditsResponse;
  }
}
