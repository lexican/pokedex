import 'package:dio/dio.dart';
import 'package:pokedex/core/constants/constants.dart';

class ApiProvider {
  final Dio _dio;

  ApiProvider() : _dio = Dio();

  //Returns a single pokemon
  Future<Response> getPokemon({
    required String path,
    Map<String, dynamic>? headers,
    ValidateStatus? validateStatus,
  }) async {
    final options = Options(
      method: 'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    Response<Object> response;

    try {
      response = await _dio.request<Object>(
        path,
        data: null,
        options: options,
      );
    } catch (e) {
      rethrow;
    }

    return Response(
      data: response.data,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  //Returns a list of pokemons
  Future<Response> getPokemons({
    int? offset,
    int? limit,
    required String path,
    Map<String, dynamic>? headers,
    ValidateStatus? validateStatus,
  }) async {
    final options = Options(
      method: 'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    Response<Object> response;

    try {
      response = await _dio.request<Object>(
        '$baseUrl$path?limit=$limit&offset=$offset',
        data: null,
        options: options,
      );
    } catch (e) {
      rethrow;
    }

    return Response(
      data: response.data,
      headers: response.headers,
      isRedirect: response.isRedirect,
      requestOptions: response.requestOptions,
      redirects: response.redirects,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }
}
