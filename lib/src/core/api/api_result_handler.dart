import 'package:dio/dio.dart';
import 'package:pokedex/src/core/api/exceptions/network_exceptions.dart';
import 'package:pokedex/src/utils/utils.dart';

import 'api_result.dart';

Future<ApiResult<T>> apiResultsHandler<T>(Function run) async {
  try {
    final response = await run();
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
