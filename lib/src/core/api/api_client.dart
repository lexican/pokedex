import 'package:dio/dio.dart';
import 'package:pokedex/src/core/api/api_result.dart';
import 'package:pokedex/src/core/api/exceptions/network_exceptions.dart';
import 'package:pokedex/src/utils/utils.dart';

class ApiClient {
  ApiClient(String baseUrl)
      : _client = Dio(
          BaseOptions(
            baseUrl: baseUrl,
          ),
        );

  final Dio _client;

  Future<ApiResult> get<T>(
    String subPath, {
    Map<String, dynamic>? parameters,
  }) async {
    try {
      dynamic response =
          await _client.get(subPath, queryParameters: parameters);
      if (response.data != null) {
        return ApiResult.success(data: response.data! as T);
      } else {
        return ApiResult.failure(
          errorMessage: NetworkExceptions.unexpectedError(),
        );
      }
    } catch (e) {
      logger.e(e);
      return ApiResult.failure(
        errorMessage: NetworkExceptions.fromDioError(e as DioError).toString(),
      );
    }
  }
}
