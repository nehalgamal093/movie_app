import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/features/profile/data/data_source/remote_data_source/profile_remote_ds.dart';
import 'package:movies_app/features/profile/data/models/edit_profile_request.dart';
import 'package:movies_app/features/profile/data/models/reset_password_request.dart';
import 'package:movies_app/features/profile/data/models/user_model.dart';
import 'package:movies_app/features/profile/data/models/wishlist_model.dart';
import '../../../../../caching/cache_helper.dart';
import '../../../../../core/resources/endpoints.dart';
import '../../../../auth/data/datasource/remote_data_source/auth_remote_data_source_impl.dart';

@Injectable(as: ProfileRemoteDs)
class ProfileRemoteDsImpl implements ProfileRemoteDs {
  APIManager apiManager;
  ProfileRemoteDsImpl(@Named('authAPIManager') this.apiManager);
  @override
  Future<UserModel> getUser() async {
    try {
      var response = await apiManager.getRequest(EndPoints.profile,
          headers: {'Authorization': 'Bearer ${CacheHelper.getToken()}'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(response.data);
      } else {
        String errorMessage = 'GetUser failed';
        if (response.data is Map<String, dynamic>) {
          errorMessage = response.data['message'][0] ?? errorMessage;
        }
        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }

  @override
  Future<WishlistModel> getWishlist() async {
    try {
      var response = await apiManager.getRequest(EndPoints.favorites,
          headers: {'Authorization': 'Bearer ${CacheHelper.getToken()}'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        return WishlistModel.fromJson(response.data);
      } else {
        String errorMessage = 'Get Wishlist failed';
        if (response.data is Map<String, dynamic>) {
          errorMessage = response.data['message'][0] ?? errorMessage;
        }
        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }

  @override
  Future<String> updateProfile({EditProfileRequest? request}) async {
    try {
      var response = await apiManager.patchRequest(
          EndPoints.profile, request!.toJson(),
          headers: {'Authorization': 'Bearer ${CacheHelper.getToken()}'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['message'];
      } else {
        String errorMessage = 'Edit profile failed';
        if (response.data is Map<String, dynamic>) {
          errorMessage = response.data['message'][0] ?? errorMessage;
        }
        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }

  @override
  Future<String> resetPassword({ResetPasswordRequest? request}) async {
    try {
      var response = await apiManager.patchRequest(
          EndPoints.profile, request!.toJson(),
          headers: {'Authorization': 'Bearer ${CacheHelper.getToken()}'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['message'];
      } else {
        String errorMessage = 'Reset Password failed';
        if (response.data is Map<String, dynamic>) {
          errorMessage = response.data['message'][0] ?? errorMessage;
        }
        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }

  @override
  Future<String> deleteAccount()async {
    try {
      var response = await apiManager.deleteRequest(
          EndPoints.profile,
          headers: {'Authorization': 'Bearer ${CacheHelper.getToken()}'});
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['message'];
      } else {
        String errorMessage = 'Deleting failed';
        if (response.data is Map<String, dynamic>) {
          errorMessage = response.data['message'][0] ?? errorMessage;
        }
        throw ServerException(errorMessage);
      }
    } on DioException catch (e) {
      throw ServerException(e.message ?? "Network error");
    }
  }
}
