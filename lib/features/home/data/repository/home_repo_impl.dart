import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/core/failures/remote_failures.dart';
import 'package:movies_app/features/home/data/datasource/remote_data_source/home_remote_datasource.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';
import 'package:movies_app/features/home/domain/repository/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(this.homeRemoteDataSource);

  @override
  Future<Either<AppFailures, MoviesModel>> getPopularMovies() async {
    try {
      var result = await homeRemoteDataSource.getPopularMovies();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures("General Issue Popular Movies "));
    }
  }

  @override
  Future<Either<AppFailures, MoviesModel>> getTopRatedMovies() async{
    try {
      var result = await homeRemoteDataSource.getTopRatedMovies();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures("General Issue Top Rated Movies"));
    }
  }
}
