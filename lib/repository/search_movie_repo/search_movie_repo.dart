import 'package:movies_app/models/movies_responses.dart';

abstract class SearchMovieRepo {

  Future<MoviesResponse> getSearchedMovies(String keyword);
}