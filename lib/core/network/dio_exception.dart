
import 'dart:io';

import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";

        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badCertificate:
        message = "Recieved bad certificate from server";
        break;
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionError:
        message = "Unable to create connection with API server";
        break;
      case DioExceptionType.badResponse:
        final data = dioError.response?.data;
        if (data != null && data is Map<String, dynamic>) {
          // Handle "message"
          if (data.containsKey("message")) {
            message = data["message"].toString();
          }

          // Handle "errors" map
          if (data.containsKey("errors") && data["errors"] is Map<String, dynamic>) {
            fieldErrors = (data["errors"] as Map<String, dynamic>).map(
                  (key, value) => MapEntry(key, (value as List).join(', ')),
            );
            // Optional: Set the first error message as `message` fallback
            message ??= fieldErrors!.values.first;
          }
          break;
        }
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.statusMessage,
        );
        break;
      case DioExceptionType.unknown:
        if (dioError.error is SocketException ||
            dioError.error is HandshakeException) {
          message = "Unable to connect. Please check that you are connected to "
              "the internet and try again.";
          break;
        }
        message = dioError.message?.isEmpty ?? true
            ? "Error retrieving information"
            : dioError.message;
        break;
    }
  }

  String? message;
  Map<String, String>? fieldErrors;

  String _handleError(int? statusCode, String? status) {
    switch (statusCode) {
      case 400:
        return status ?? 'Bad request';
      case 401:
        return status ?? 'Missing API Key';
      case 403:
        return status ?? "UnExpected error";
      case 404:
        return status ?? 'The requested resource was not found';
      case 500:
        return 'Internal server error';
      case 429:
        return 'Request limit reached';
      default:
        return 'Oops something went wrong. $status';
    }
  }

  @override
  String toString() => message!;
}
