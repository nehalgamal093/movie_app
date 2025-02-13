import 'dart:convert';
import 'package:movies_app/models/add_movie_response.dart';
import 'package:movies_app/models/delete_movie_response.dart';
import 'package:movies_app/models/is_movie_favorite.dart';
import 'package:movies_app/models/movie_details_response.dart';
import 'package:movies_app/repository/movie_details_repo/movie_details_repo.dart';
import '../../caching/cache_helper.dart';
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

  @override
  Future<AddMovieResponse> addMovie(String movieId, String name, String imageUrl,
      int rating, String year) async {
    Uri url = Uri.https(
      Constants.routeBaseUrl,
      Constants.addFavoriteEndPoint,
    );

    http.Response response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${CacheHelper.getToken()}',
        },
        body: jsonEncode({

            "movieId": movieId,
            "name": name,
            "rating": rating,
            "imageURL": imageUrl,
            "year": year

        }));
    var json = jsonDecode(response.body);
    AddMovieResponse addMovieResponse = AddMovieResponse.fromJson(json);
    return addMovieResponse;
  }

  @override
  Future<IsMovieFavorite> isMovieFavorite(String id) async {
    Uri url = Uri.https(
      Constants.routeBaseUrl,
      "${Constants.isMovieFavoriteEndPoint}/$id",
    );

    http.Response response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getToken()}',
      },
    );
    var json = jsonDecode(response.body);
    IsMovieFavorite isMovieFavorite = IsMovieFavorite.fromJson(json);
    return isMovieFavorite;
  }

  @override
  Future<DeleteMovieResponse> deleteMovie(String id) async{
    Uri url = Uri.https(
      Constants.routeBaseUrl,
      "${Constants.deleteMovieEndPoint}/$id",
    );

    http.Response response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getToken()}',
      },
    );
    var json = jsonDecode(response.body);
    DeleteMovieResponse deleteMovieResponse = DeleteMovieResponse.fromJson(json);
    return deleteMovieResponse;
  }
}
