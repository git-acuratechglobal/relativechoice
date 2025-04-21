import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relative_choice/core/network/dio_client.dart';

final apiClientProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return ApiClient( dio);
});

class ApiClient {
  final Dio _dio;

  ApiClient( this._dio);



  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    return asyncGuard(() async {
      return await _dio.get(
        path,
        queryParameters: queryParams,
        options: Options(headers: _mergeHeaders(headers)),
      );
    });
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return asyncGuard(() async {
      return await _dio.post(
        path,
        data: data,
        options: Options(headers: _mergeHeaders(headers)),
      );
    });
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return asyncGuard(() async {
      return await _dio.put(
        path,
        data: data,
        options: Options(headers: _mergeHeaders(headers)),
      );
    });
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return asyncGuard(() async {
      return await _dio.delete(
        path,
        data: data,
        options: Options(headers: _mergeHeaders(headers)),
      );
    });
  }

  Future<Response> asyncGuard<Response>(
      Future<Response> Function() apiCall) async {
    try {
      return await apiCall();
    } on DioException catch (e) {
      final msg = e.message ?? e.error.toString();
      throw Exception("API Error: $msg");
    } on CheckedFromJsonException catch (e) {
      throw "Something went wrong! ${e.toString()}"
          .replaceAll("CheckedFromJsonException", "");
    } on FormatException catch (e) {
      throw "Unable to process data from server. reason: ${e.message}";
    } catch (e) {
      rethrow;
    }
  }


  Map<String, dynamic> _mergeHeaders(Map<String, dynamic>? additionalHeaders) {
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (additionalHeaders != null) ...additionalHeaders,
    };
  }
}
