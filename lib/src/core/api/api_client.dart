import 'package:dio/dio.dart';

class ApiClient {
  ApiClient(String baseUrl)
      : _client = Dio(
          BaseOptions(
            baseUrl: baseUrl,
          ),
        );

  final Dio _client;

  Future<Response> get(
    String subPath, {
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final response = await _client.get(subPath, queryParameters: parameters);
      return response;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
