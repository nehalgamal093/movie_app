import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';
import 'package:movies_app/features/movie_details/domain/repository/movie_details_repo.dart';


@injectable
class MovieDetailsUseCase {
  MovieDetailsRepo movieDetailsRepo;
  MovieDetailsUseCase(this.movieDetailsRepo);

  Future<Either<AppFailures, MovieModel>> call(String id) =>
      movieDetailsRepo.getMovieDetails(id);
}
