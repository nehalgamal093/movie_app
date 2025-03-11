import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/core/failures/remote_failures.dart';
import 'package:movies_app/features/home/data/models/movies_model.dart';
import 'package:movies_app/features/movie_details/data/models/credit_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_images.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';
import 'package:movies_app/features/movie_details/domain/repository/movie_details_repo.dart';
import '../datasource/movie_details_remote_data_source.dart';

@Injectable(as: MovieDetailsRepo)
class MovieDetailsRepoImpl implements MovieDetailsRepo {
  MovieDetailsRemoteDataSource movieDetailsRemoteDataSource;
  MovieDetailsRepoImpl(this.movieDetailsRemoteDataSource);

  @override
  Future<Either<AppFailures, MovieModel>> getMovieDetails(String id) async {
    try {
      var result = await movieDetailsRemoteDataSource.getMovieDetails(id);
      return Right(result);
    } catch (e) {
      return Left(
        RemoteFailures("General Issue Movie Details"),
      );
    }
  }

  @override
  Future<Either<AppFailures, MovieImages>> getMovieImages(String id) async {
    try {
      var result = await movieDetailsRemoteDataSource.getMovieScreenShots(id);
      return Right(result);
    } catch (e) {
      return Left(
        RemoteFailures("General Issue Movie Images"),
      );
    }
  }

  @override
  Future<Either<AppFailures, MoviesModel>> getSimilarMovies(String id) async {
    try {
      var result = await movieDetailsRemoteDataSource.getSimilarMovies(id);

      return Right(result);
    } catch (e) {
      return Left(
        RemoteFailures("General Issue Similar Movies"),
      );
    }
  }

  @override
  Future<Either<AppFailures, CreditModel>> getCredits(String id) async {
    try {
      var result = await movieDetailsRemoteDataSource.getCredits(id);

      return Right(result);
    } catch (e) {
      return Left(
        RemoteFailures("General Issue Credits"),
      );
    }
  }
}
