import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';
import '../../../../core/failures/failures.dart';
import '../repository/browse_repo.dart';

@injectable
class GetMoviesByGenreUseCase {
  BrowseRepo repo;
  GetMoviesByGenreUseCase(this.repo);

  Future<Either<AppFailures, MoviesModel>> call(String id) =>
      repo.getMoviesByCategory(id);
}
