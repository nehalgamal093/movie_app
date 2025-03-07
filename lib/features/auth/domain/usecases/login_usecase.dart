import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/auth/data/models/login_model.dart';
import 'package:movies_app/features/auth/domain/repository/auth_repo.dart';


@injectable
class LoginUseCase {
  AuthRepo authRepo;
  LoginUseCase(this.authRepo);
  Future<Either<AppFailures, LoginModel>> call(String email, String password) =>
      authRepo.login(email, password);
}
