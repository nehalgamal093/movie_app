
import 'package:movies_app/models/favorite_movies.dart';

abstract class FavoriteMovieRepo {
  Future<FavoriteMovies> getFavoriteMovies();
}
