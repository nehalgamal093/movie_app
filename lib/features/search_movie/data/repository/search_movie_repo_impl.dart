import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';
import 'package:movies_app/features/search_movie/data/datasource/remote_data_source/search_remote_data_source.dart';
import 'package:movies_app/features/search_movie/domain/repository/search_movie_repo.dart';

import '../../../../core/failures/remote_failures.dart';

@Injectable(as: SearchMovieRepo)
class SearchMovieRepoImpl implements SearchMovieRepo {
  SearchRemoteDataSource searchRemoteDataSource;
  SearchMovieRepoImpl(this.searchRemoteDataSource);
  @override
  Future<Either<AppFailures, MoviesModel>> searchMovie(String keyword) async {
    try {
      var result = await searchRemoteDataSource.searchMovie(keyword);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures("General Issue Search"));
    }
  }
}
