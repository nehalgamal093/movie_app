import 'dart:convert';
import 'package:movies_app/models/login_response.dart';
import 'package:movies_app/models/register_response.dart';
import 'package:movies_app/models/user_model.dart';
import 'package:movies_app/repository/auth_repo/auth_repo.dart';
import 'package:http/http.dart' as http;
import '../../constants/constants.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<RegisterResponse> register(UserModel userModel) async {
    Uri url = Uri.https(
      Constants.routeBaseUrl,
      Constants.registerEndPoint,
    );

    http.Response response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": userModel.email,
          "name": userModel.name,
          "password": userModel.password,
          "confirmPassword": userModel.confirmPassword,
          "phone": userModel.phone,
          "avaterId": 1
        }));
    var json = jsonDecode(response.body);
    RegisterResponse registerResponse = RegisterResponse.fromJson(json);
    return registerResponse;
  }

  @override
  Future<LoginResponse> login(String email, String password) async {
    Uri url = Uri.https(
      Constants.routeBaseUrl,
      Constants.loginEndPoint,
    );

    http.Response response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }));
    var json = jsonDecode(response.body);
    LoginResponse registerResponse = LoginResponse.fromJson(json);

    return registerResponse;
  }


}
