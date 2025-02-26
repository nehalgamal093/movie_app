import 'package:movies_app/features/browse/data/models/genres_model.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';

abstract class BrowseRemoteDataSource{
  Future<GenresModel> getGenres();
  Future<MoviesModel> getMoviesByGenre(String id);
}