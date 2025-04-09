import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class APIManager {
  final Dio dio;

  APIManager(this.dio);

  Future<Response> getRequest(String endpoint,
      {Map<String, dynamic>? params, Map<String, dynamic>? headers}) async {
    try {
      return await dio.get(
        endpoint,
        queryParameters: params,
        options: Options(headers: headers),
      );
    } on DioException catch (e) {
      throw Exception('Failed to GET: $e');
    }
  }

  Future<Response> postRequest(String endpoint, dynamic data,
      {Map<String, dynamic>? headers}) async {
    try {
      return await dio.post(
        endpoint,
        data: data,
        options: Options(headers: headers),
      );
    } on DioException catch (e) {
      throw Exception('Failed to Post: $e');
    }
  }
  Future<Response> patchRequest(String endpoint, dynamic data,
      {Map<String, dynamic>? headers}) async {
    try {
      return await dio.patch(
        endpoint,
        data: data,
        options: Options(headers: headers),
      );
    } on DioException catch (e) {
      throw Exception('Failed to Patch: $e');
    }
  }
  Future<Response> deleteRequest(String endpoint,
      {Map<String, dynamic>? headers}) async {
    try {
      return await dio.delete(
        endpoint,
        options: Options(headers: headers),
      );
    } on DioException catch (e) {
      throw Exception('Failed to Delete: $e');
    }
  }
}
