import 'package:movies_app/features/home/data/models/movies_model.dart';

abstract class SearchRemoteDataSource {
  Future<MoviesModel> searchMovie(String keyword);
}
