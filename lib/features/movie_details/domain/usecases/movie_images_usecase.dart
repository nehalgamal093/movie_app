import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/movie_details/data/models/movie_images.dart';
import 'package:movies_app/features/movie_details/domain/repository/movie_details_repo.dart';
import '../../../../core/failures/failures.dart';

@injectable
class MovieImagesUseCase {
  MovieDetailsRepo movieDetailsRepo;
  MovieImagesUseCase(this.movieDetailsRepo);

  Future<Either<AppFailures, MovieImages>> call(String id) =>
      movieDetailsRepo.getMovieImages(id);
}
