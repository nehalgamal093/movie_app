import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_images.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';

import '../../data/models/credit_model.dart';

abstract class MovieDetailsRepo{
  Future<Either<AppFailures,MovieModel>> getMovieDetails(String id);
  Future<Either<AppFailures,MovieImages>> getMovieImages(String id);
  Future<Either<AppFailures,MoviesModel>> getSimilarMovies(String id);
  Future<Either<AppFailures,CreditModel>> getCredits(String id);
}