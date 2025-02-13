import 'package:movies_app/models/genres_response.dart';
import 'package:movies_app/models/movies_responses.dart';

abstract class MovieGenresRepo {
  Future<GenresResponse> getGenres();
  Future<MoviesResponse> getMovies(String id);
}