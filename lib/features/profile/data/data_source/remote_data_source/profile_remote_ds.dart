import 'package:movies_app/features/profile/data/models/edit_profile_request.dart';
import 'package:movies_app/features/profile/data/models/user_model.dart';

import '../../models/reset_password_request.dart';
import '../../models/wishlist_model.dart';

abstract class ProfileRemoteDs{
  Future<UserModel> getUser();
  Future<WishlistModel> getWishlist();
  Future<String> updateProfile({EditProfileRequest? request});
  Future<String> resetPassword({ResetPasswordRequest? request});
  Future<String>deleteAccount();
}