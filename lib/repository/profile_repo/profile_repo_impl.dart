import 'dart:convert';
import 'package:movies_app/models/profile_update_response.dart';
import 'package:movies_app/models/register_response.dart';
import 'package:movies_app/repository/profile_repo/profile_repo.dart';
import '../../caching/cache_helper.dart';
import '../../constants/constants.dart';
import '../../models/reset_password_response.dart';
import 'package:http/http.dart' as http;

class ProfileRepoImpl extends ProfileRepo {
  @override
  Future<ResetPasswordResponse> resetPassword(
      String oldPassword, String newPassword) async {
    Uri url = Uri.https(
      Constants.routeBaseUrl,
      Constants.resetPasswordEndPoint,
    );
    http.Response response = await http.patch(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${CacheHelper.getToken()}'
        },
        body: jsonEncode(
            {"oldPassword": oldPassword, "newPassword": newPassword}));
    var json = jsonDecode(response.body);
    ResetPasswordResponse resetPasswordResponse =
        ResetPasswordResponse.fromJson(json);

    return resetPasswordResponse;
  }

  @override
  Future<RegisterResponse> getProfile() async {
    Uri url = Uri.https(
      Constants.routeBaseUrl,
      Constants.profileEndPoint,
    );
    http.Response response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getToken()}'
      },
    );
    var json = jsonDecode(response.body);
    RegisterResponse registerResponse = RegisterResponse.fromJson(json);

    return registerResponse;
  }

  @override
  Future<ProfileUpdateResponse> updateProfile(
      String email, num avatarId) async {
    Uri url = Uri.https(
      Constants.routeBaseUrl,
      Constants.profileEndPoint,
    );
    http.Response response = await http.patch(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${CacheHelper.getToken()}',
        },
        body: jsonEncode({"email": email, "avaterId": avatarId}));
    var json = jsonDecode(response.body);
    ProfileUpdateResponse profileUpdateResponse =
        ProfileUpdateResponse.fromJson(json);

    return profileUpdateResponse;
  }

  @override
  Future<ProfileUpdateResponse> deleteAccount() async {
    Uri url = Uri.https(
      Constants.routeBaseUrl,
      Constants.profileEndPoint,
    );
    http.Response response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getToken()}',
      },
    );
    var json = jsonDecode(response.body);
    ProfileUpdateResponse profileUpdateResponse =
        ProfileUpdateResponse.fromJson(json);
print(json);
    return profileUpdateResponse;
  }
}
