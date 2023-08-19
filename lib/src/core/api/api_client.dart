import 'package:dio/dio.dart';

class ApiClient {
  late Dio _client;
  ApiClient(String baseUrl, {Dio? dio}) {
    _client = dio ??
        Dio(
          BaseOptions(
            baseUrl: baseUrl,
          ),
        );
  }

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
