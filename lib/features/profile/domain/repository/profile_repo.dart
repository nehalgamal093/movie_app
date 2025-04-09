import 'package:dartz/dartz.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/profile/data/models/reset_password_request.dart';
import 'package:movies_app/features/profile/data/models/user_model.dart';
import '../../data/models/edit_profile_request.dart';
import '../../data/models/wishlist_model.dart';

abstract class ProfileRepo {
  Future<Either<AppFailures, UserModel>> getUser();
  Future<Either<AppFailures, WishlistModel>> getWishlist();
  Future<Either<AppFailures, String>> updateProfile(
      {EditProfileRequest? request});
  Future<Either<AppFailures, String>> resetPassword(
      {ResetPasswordRequest? request});
  Future<Either<AppFailures, String>> deleteAccount();
}
