import 'dart:convert';

import 'package:dio/dio.dart';

import '../../model/error_response.dart';

class DioExceptions implements Exception {
  late String message;
  late int code;
  late ErrorResponse errorResponse;

  DioExceptions.fromDioError(DioException dioError) {
    if (dioError.response != null) {
      message =
          _handleError(dioError.response!.statusCode!, dioError.response!.data);
      code = dioError.response!.statusCode!;
      errorResponse = ErrorResponse(
          statusCode: code, statusMessage: message, success: false);
      return;
    }

    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        code = -10;
        errorResponse = ErrorResponse(
            statusCode: code, statusMessage: message, success: false);
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        code = -10;
        errorResponse = ErrorResponse(
            statusCode: code, statusMessage: message, success: false);
        break;
      case DioExceptionType.unknown:
        message = "Connection to API server failed due to internet connection";
        code = -10;
        errorResponse = ErrorResponse(
            statusCode: code, statusMessage: message, success: false);
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        code = -10;
        errorResponse = ErrorResponse(
            statusCode: code, statusMessage: message, success: false);
        break;

      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        code = -10;
        errorResponse = ErrorResponse(
            statusCode: code, statusMessage: message, success: false);
        break;
      default:
        message = "Something went wrong";
        code = -10;
        errorResponse = ErrorResponse(
            statusCode: code, statusMessage: message, success: false);
        break;
    }
  }

  String _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
      case 422:
        final ErrorResponse errorResponse =
            ErrorResponse.fromJson(json.decode(error));
        if (errorResponse.statusMessage != null &&
            errorResponse.statusMessage!.isNotEmpty) {
          return errorResponse.statusMessage ?? "unknown error";
        }
        return "unknown error";

      case 404:
        return "not found";
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;

  ErrorResponse getCustomResponse() =>
      ErrorResponse(statusCode: code, statusMessage: message, success: false);
}
