import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/resources/constants_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_manager.dart';

@module
abstract class DioModule {
  @Named('auth')
  Dio get authDio {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.authBaseUrl,
        headers: {'Content-Type': 'application/json'},
        validateStatus: (status) => true,
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        responseBody: true,
        requestBody: true,
        request: true,
      ),
    );
    return dio;
  }

  @Named('api')
  Dio get apiDio {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        headers: {'Content-Type': 'application/json'},
        validateStatus: (status) => true,
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        responseBody: true,
        requestBody: true,
        request: true,
      ),
    );
    return dio;
  }
}

@module
abstract class AppModule {
  @Named('authAPIManager')
  APIManager authAPIManager(@Named('auth') Dio dio) => APIManager(dio);

  @Named('moviesAPIManager')
  APIManager apiAPIManager(@Named('api') Dio dio) => APIManager(dio);
}