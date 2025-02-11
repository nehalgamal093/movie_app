import 'dart:convert';
import 'package:movies_app/models/favorite_movies.dart';
import 'package:movies_app/repository/fav_movies_repo/fav_movie_repo.dart';
import 'package:http/http.dart' as http;
import '../../caching/cache_helper.dart';
import '../../constants/constants.dart';

class FavoriteMovieRepoImpl extends FavoriteMovieRepo {
  @override
  Future<FavoriteMovies> getFavoriteMovies() async {
    Uri url = Uri.https(
      Constants.routeBaseUrl,
      Constants.favoriteMoviesEndPoint,
    );

    http.Response response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getToken()}',
      },
    );
    var json = jsonDecode(response.body);
    FavoriteMovies favoriteMovies = FavoriteMovies.fromJson(json);
    return favoriteMovies;
  }
}
