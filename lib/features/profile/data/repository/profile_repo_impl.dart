import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/profile/data/data_source/remote_data_source/profile_remote_ds.dart';
import 'package:movies_app/features/profile/data/models/edit_profile_request.dart';
import 'package:movies_app/features/profile/data/models/reset_password_request.dart';
import 'package:movies_app/features/profile/data/models/user_model.dart';
import 'package:movies_app/features/profile/data/models/wishlist_model.dart';
import 'package:movies_app/features/profile/domain/repository/profile_repo.dart';

import '../../../../core/failures/remote_failures.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  ProfileRemoteDs profileRemoteDs;
  ProfileRepoImpl(this.profileRemoteDs);

  @override
  Future<Either<AppFailures, UserModel>> getUser() async {
    try {
      var result = await profileRemoteDs.getUser();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures("General Issue get user "));
    }
  }

  @override
  Future<Either<AppFailures, WishlistModel>> getWishlist() async {
    try {
      var result = await profileRemoteDs.getWishlist();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures("General Issue get wishlist"));
    }
  }

  @override
  Future<Either<AppFailures, String>> updateProfile(
      {EditProfileRequest? request}) async {
    try {
      var result = await profileRemoteDs.updateProfile(request: request);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures("General Issue Update profile "));
    }
  }

  @override
  Future<Either<AppFailures, String>> resetPassword(
      {ResetPasswordRequest? request}) async {
    try {
      var result = await profileRemoteDs.resetPassword(request: request);
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures("General Issue Reset Password "));
    }
  }

  @override
  Future<Either<AppFailures, String>> deleteAccount() async{
    try {
      var result = await profileRemoteDs.deleteAccount();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailures("General Issue Deleting Account "));
    }
  }
}
