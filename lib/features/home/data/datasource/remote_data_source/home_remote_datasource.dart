import 'package:movies_app/features/home/data/models/movies_model.dart';

abstract class HomeRemoteDataSource {
  Future <MoviesModel> getPopularMovies();
  Future <MoviesModel> getTopRatedMovies();
}
