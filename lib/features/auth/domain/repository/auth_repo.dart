import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/auth/data/models/auth_model.dart';

import '../../data/models/login_model.dart';
import '../../data/models/register_request_model.dart';

abstract class AuthRepo {
  Future<Either<AppFailures,AuthModel>> register(
      {required RegisterRequestModel request});
  Future<Either<AppFailures,LoginModel>> login(
      String email,String password);
}
