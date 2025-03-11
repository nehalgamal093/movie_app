import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';

abstract class SearchMovieRepo{
  Future<Either<AppFailures,MoviesModel>> searchMovie(String keyword);
}