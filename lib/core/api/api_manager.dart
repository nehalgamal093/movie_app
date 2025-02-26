import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/resources/constants_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@lazySingleton
class APIManager {
  late Dio _dio;

  APIManager() {
    _dio = Dio(
      BaseOptions(
          baseUrl: AppConstants.baseUrl,
          headers: {'Content-Type': 'application/json'}),
    );
    _dio.interceptors.add(
      PrettyDioLogger(
          requestHeader: true,
          responseBody: true,
          requestBody: true,
          request: true),
    );
//add interceptor wrapper
  }
  Future<Response> getRequest(String endpoint,
      {Map<String, dynamic>? params, Map<String, dynamic>? headers}) async {
    try {
      return await _dio.get(endpoint,
          queryParameters: params, options: Options(headers: headers));
    } on DioException catch (e) {
      throw Exception('Failed to GET: $e');
    }
  }
}
