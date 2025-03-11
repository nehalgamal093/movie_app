import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';
import '../../../../core/failures/failures.dart';
import '../repository/movie_details_repo.dart';

@injectable
class SimilarMoviesUseCase {

  MovieDetailsRepo movieDetailsRepo;
  SimilarMoviesUseCase(this.movieDetailsRepo);

  Future<Either<AppFailures, MoviesModel>> call(String id) =>
      movieDetailsRepo.getSimilarMovies(id);
}
