import 'package:movies_app/features/home/data/models/movies_model.dart';
import 'package:movies_app/features/movie_details/data/models/credit_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_images.dart';

import '../models/movie_model.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieModel> getMovieDetails(String id);
  Future<MovieImages> getMovieScreenShots(String id);
  Future<MoviesModel> getSimilarMovies(String id);
  Future<CreditModel> getCredits(String id);
}
