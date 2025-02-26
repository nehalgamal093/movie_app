import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/browse/data/datasource/remote_data_source/browse_remote_datasource.dart';
import 'package:movies_app/features/browse/data/models/genres_model.dart';
import 'package:movies_app/features/browse/domain/repository/browse_repo.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';
import '../../../../core/failures/remote_failures.dart';

@Injectable(as: BrowseRepo)
class BrowseRepoImpl implements BrowseRepo {
  BrowseRemoteDataSource browseRemoteDataSource;
  BrowseRepoImpl(this.browseRemoteDataSource);

  @override
  Future<Either<AppFailures, GenresModel>> getGenres() async {
    try {
      var result = await browseRemoteDataSource.getGenres();
      return Right(result);
    } catch (e) {
      return Left(
        RemoteFailures("General Issue Genres "),
      );
    }
  }

  @override
  Future<Either<AppFailures, MoviesModel>> getMoviesByCategory(
      String id) async {
    try {
      var result = await browseRemoteDataSource.getMoviesByGenre(id);
      return Right(result);
    } catch (e) {
      return Left(
        RemoteFailures("General Issue Get movies by category "),
      );
    }
  }
}
