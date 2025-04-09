import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/profile/domain/repository/profile_repo.dart';
import '../../data/models/edit_profile_request.dart';

@injectable
class UpdateProfileUseCase {
  ProfileRepo profileRepo;
  UpdateProfileUseCase(this.profileRepo);

  Future<Either<AppFailures, String>> call({EditProfileRequest? request}) =>
      profileRepo.updateProfile(request: request);
}
