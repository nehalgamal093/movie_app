import 'package:movies_app/models/movies_responses.dart';

abstract class SimilarMoviesRepo{
  Future<MoviesResponse> getSimilarMovies(String id);
}