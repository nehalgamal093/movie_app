import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/profile/data/models/wishlist_model.dart';
import 'package:movies_app/features/profile/domain/repository/profile_repo.dart';

@injectable
class WishlistUseCase {
  ProfileRepo profileRepo;

  WishlistUseCase(this.profileRepo);

  Future<Either<AppFailures, WishlistModel>> call() =>
      profileRepo.getWishlist();
}
