import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/home/domain/repository/home_repo.dart';
import '../../../../core/failures/failures.dart';
import '../../data/models/movies_model.dart';

@injectable
class GetTopRatedMoviesUseCase {
  HomeRepo repo;
  GetTopRatedMoviesUseCase(this.repo);

  Future<Either<AppFailures, MoviesModel>> call() => repo.getTopRatedMovies();
}
