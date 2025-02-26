import 'package:dartz/dartz.dart';
import 'package:movies_app/features/browse/data/models/genres_model.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';
import '../../../../core/failures/failures.dart';

abstract class BrowseRepo{
  Future<Either<AppFailures, GenresModel>> getGenres();
  Future<Either<AppFailures, MoviesModel>> getMoviesByCategory(String id);
}