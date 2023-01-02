import 'package:dio/dio.dart';
import 'package:pokedex/src/utils/utils.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioError dioError) {
    logger.i("dioError : ${dioError.toString()}");
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        showErrorMessage(message);
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        showErrorMessage(message);
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        showErrorMessage(message);
        break;
      case DioErrorType.response:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        showErrorMessage(message);
        break;
      case DioErrorType.other:
        if (dioError.message.contains("SocketException")) {
          message = 'No Internet';
          showErrorMessage(message);
          break;
        }
        message = "Unexpected error occurred";
        showErrorMessage(message);
        break;
      default:
        message = "Something went wrong";
        showErrorMessage(message);
        break;
    }
  }

  void showErrorMessage(String message) {
    logger.i("Error message : $message");
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error['message'];
      case 406:
        return handleError404(error);
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  String handleError404(dynamic error) {
    logger.i("Error: $error");
    return error.toString();
  }

  @override
  String toString() => message;
}
