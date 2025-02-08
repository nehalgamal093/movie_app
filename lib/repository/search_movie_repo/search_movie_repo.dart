import 'package:movies_app/models/MoviesResponse.dart';

abstract class SearchMovieRepo {

  Future<MoviesResponse> getSearchedMovies(String keyword);
}