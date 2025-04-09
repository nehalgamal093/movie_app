import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/profile/data/models/user_model.dart';
import 'package:movies_app/features/profile/domain/repository/profile_repo.dart';
import '../../../../core/failures/failures.dart';


@injectable
class UserUseCase {
  ProfileRepo profileRepo;
  UserUseCase(this.profileRepo);

  Future<Either<AppFailures, UserModel>> call() => profileRepo.getUser();
}
