import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/auth/data/models/auth_model.dart';
import 'package:movies_app/features/auth/domain/repository/auth_repo.dart';

import '../../data/models/register_request_model.dart';

@injectable
class RegisterUseCase {
  AuthRepo authRepo;
  RegisterUseCase(this.authRepo);
  Future<Either<AppFailures, AuthModel>> call(
          {required RegisterRequestModel request}) =>
      authRepo.register(request: request);
}
