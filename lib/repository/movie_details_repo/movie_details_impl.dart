import 'dart:convert';

import 'package:movies_app/models/MovieDetailsResponse.dart';
import 'package:movies_app/repository/movie_details_repo/movie_details_repo.dart';

import '../../constants/constants.dart';
import 'package:http/http.dart' as http;

class MovieDetailsImpl extends MovieDetailsRepo {
  @override
  Future<MovieDetailsResponse> getMovieDetails(String id) async {
    Uri url = Uri.https(Constants.baseUrl, '${Constants.movieDetails}/$id',
        {"api_key": Constants.apiKey});

    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    MovieDetailsResponse movieDetailsResponse =
        MovieDetailsResponse.fromJson(json);
    return movieDetailsResponse;
  }
}
