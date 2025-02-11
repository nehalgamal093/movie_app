import 'package:movies_app/models/login_response.dart';
import 'package:movies_app/models/profile_update_response.dart';
import 'package:movies_app/models/register_response.dart';
import 'package:movies_app/models/reset_password_response.dart';

abstract class ProfileRepo{
  Future<ResetPasswordResponse> resetPassword(String oldPassword,String newPassword);
  Future<RegisterResponse> getProfile();
  Future<ProfileUpdateResponse> updateProfile(String email,int avatarId);
  Future<ProfileUpdateResponse> deleteAccount();
}