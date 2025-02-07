import 'package:movies_app/models/GenresResponse.dart';
import 'package:movies_app/models/MoviesResponse.dart';

abstract class MovieGenresRepo {
  Future<GenresResponse> getGenres();
  Future<MoviesResponse> getMovies(String id);
}