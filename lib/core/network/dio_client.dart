import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'apiend_points.dart';
import 'dio_exception.dart';



final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiEndPoints.baseUrl,
      responseType: ResponseType.json,
      receiveTimeout: const Duration(minutes: 1),
      sendTimeout: const Duration(minutes: 1),
      connectTimeout: const Duration(minutes: 1),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
    requestHeader: true,
    responseHeader: false,
  ));

  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (e, handler) {
        final message = DioExceptions.fromDioError(e);
        return handler.reject(
          DioException(requestOptions: e.requestOptions, error: message),
        );
      },
    ),
  );

  return dio;
});