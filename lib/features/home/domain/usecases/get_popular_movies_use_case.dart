import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';
import 'package:movies_app/features/home/domain/repository/home_repo.dart';

@injectable
class GetPopularMoviesUseCase {
  HomeRepo repo;
  GetPopularMoviesUseCase(this.repo);

  Future<Either<AppFailures, MoviesModel>> call() => repo.getPopularMovies();
}
