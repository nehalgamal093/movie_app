import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';
import 'package:movies_app/features/search_movie/domain/repository/search_movie_repo.dart';


@injectable
class SearchUseCase {
  SearchMovieRepo searchMovieRepo;
  SearchUseCase(this.searchMovieRepo);

  Future<Either<AppFailures, MoviesModel>> call(String keyword) =>
      searchMovieRepo.searchMovie(keyword);
}
