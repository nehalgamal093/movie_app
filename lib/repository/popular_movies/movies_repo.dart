import 'package:movies_app/models/MoviesResponse.dart';

abstract class PopularMoviesRepo {
  Future<MoviesResponse> getPopularMovies();
  Future<MoviesResponse> getTopRatedMovies();
}
