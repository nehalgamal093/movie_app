import 'package:movies_app/models/MoviesResponse.dart';

abstract class SimilarMoviesRepo{
  Future<MoviesResponse> getSimilarMovies(String id);
}