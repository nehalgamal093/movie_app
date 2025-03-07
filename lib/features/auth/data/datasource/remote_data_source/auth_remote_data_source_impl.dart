import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/resources/endpoints.dart';
import 'package:movies_app/features/auth/data/models/auth_model.dart';
import 'package:movies_app/features/auth/data/models/login_model.dart';
import 'package:movies_app/features/auth/data/models/register_request_model.dart';
import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  APIManager apiManager;

  AuthRemoteDataSourceImpl(@Named('authAPIManager') this.apiManager);

  @override
  Future<AuthModel> register({RegisterRequestModel? request}) async {
    try {
      var response = await apiManager.postRequest(
        EndPoints.register,
        request!.toJson(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthModel.fromJson(response.data);
      } else {
        String errorMessage = 'Registration failed';
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
  Future<LoginModel> login(String email, String password) async {
    try {
      var response = await apiManager.postRequest(
        EndPoints.login,
        {"email": email, "password": password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return LoginModel.fromJson(response.data);
      } else {
        String errorMessage = 'Login failed';
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

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}
