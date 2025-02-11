import 'package:movies_app/models/DeleteMovieResponse.dart';
import 'package:movies_app/models/IsMovieFavorite.dart';
import 'package:movies_app/models/MovieDetailsResponse.dart';
import '../../models/AddMovieResponse.dart';


abstract class MovieDetailsRepo {
  Future<MovieDetailsResponse> getMovieDetails(String id);
  Future<AddMovieResponse> addMovie(
      String movieId, String name, String imageUrl, int rating, String year);
  Future<IsMovieFavorite> isMovieFavorite(String id);
  Future<DeleteMovieResponse> deleteMovie(String id);
}
