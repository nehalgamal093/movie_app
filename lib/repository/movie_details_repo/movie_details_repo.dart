import 'package:movies_app/models/delete_movie_response.dart';
import 'package:movies_app/models/is_movie_favorite.dart';
import 'package:movies_app/models/movie_details_response.dart';
import '../../models/add_movie_response.dart';
import '../../models/favorite_movies.dart';


abstract class MovieDetailsRepo {
  Future<MovieDetailsResponse> getMovieDetails(String id);
  Future<AddMovieResponse> addMovie(
      String movieId, String name, String imageUrl, int rating, String year);
  Future<IsMovieFavorite> isMovieFavorite(String id);
  Future<DeleteMovieResponse> deleteMovie(String id);
  Future<FavoriteMovies> getFavoriteMovies();
}
