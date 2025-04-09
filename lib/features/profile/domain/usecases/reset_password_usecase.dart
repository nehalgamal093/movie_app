import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/profile/domain/repository/profile_repo.dart';
import '../../../../core/failures/failures.dart';
import '../../data/models/reset_password_request.dart';

@injectable
class ResetPasswordUseCase {
  ProfileRepo profileRepo;
  ResetPasswordUseCase(this.profileRepo);

  Future<Either<AppFailures, String>> call({ResetPasswordRequest? request}) =>
      profileRepo.resetPassword(request: request);
}
