import 'package:movies_app/models/movies_responses.dart';

abstract class PopularMoviesRepo {
  Future<MoviesResponse> getPopularMovies();
  Future<MoviesResponse> getTopRatedMovies();
}
