import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/core/failures/remote_failures.dart';
import 'package:movies_app/features/auth/data/datasource/remote_data_source/auth_remote_data_source.dart';
import 'package:movies_app/features/auth/data/models/auth_model.dart';
import 'package:movies_app/features/auth/data/models/login_model.dart';
import 'package:movies_app/features/auth/data/models/register_request_model.dart';
import 'package:movies_app/features/auth/domain/repository/auth_repo.dart';
import '../datasource/remote_data_source/auth_remote_data_source_impl.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl(this.authRemoteDataSource);

  @override
  Future<Either<AppFailures, AuthModel>> register(
      {required RegisterRequestModel request}) async {
    try {
      var result = await authRemoteDataSource.register(request: request);
      return Right(result);
    } on ServerException catch (e) {
      return Left(RemoteFailures(e.message));
    } on DioException catch (e) {
      return Left(RemoteFailures(e.message ?? "Network error"));
    } catch (e) {
      return Left(RemoteFailures("An unexpected error occurred"));
    }
  }

  @override
  Future<Either<AppFailures, LoginModel>> login(String email, String password) async{
    try {
      var result = await authRemoteDataSource.login(email, password);
      return Right(result);
    } on ServerException catch (e) {
      return Left(RemoteFailures(e.message));
    } on DioException catch (e) {
      return Left(RemoteFailures(e.message ?? "Network error"));
    } catch (e) {
      return Left(RemoteFailures("An unexpected error occurred"));
    }
  }

}

