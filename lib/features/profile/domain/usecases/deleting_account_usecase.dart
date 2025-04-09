import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/profile/domain/repository/profile_repo.dart';

import '../../../../core/failures/failures.dart';

@injectable
class DeletingAccountUseCase {
  ProfileRepo profileRepo;
  DeletingAccountUseCase(this.profileRepo);

  Future<Either<AppFailures, String>> call() => profileRepo.deleteAccount();
}
