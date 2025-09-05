import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import '../../features/auth_feature/pages/welcome_screen.dart';
import '../../main.dart';
import '../services/local_storage_service/local_storage_service.dart';
import '../utils/appsnackbar.dart';
import 'apiend_points.dart';
import 'dio_exception.dart';


bool _isLoggingOut = false;
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
      onError: (e, handler) async {
        if (e.response?.statusCode == 401) {
          if (_isLoggingOut) return;
          _isLoggingOut = true;
          final context = navigatorKey.currentContext;
          if (context == null) return;
          ref.read(localStorageServiceProvider).clearSession();
          context.navigateAndRemoveUntil(const WelcomeScreen());
          Utils.showSnackBar(context, "Session expired. Please login again.");
        }
        final message = DioExceptions.fromDioError(e);
        return handler.reject(
          DioException(requestOptions: e.requestOptions, error: message),
        );
      },
    ),
  );

  return dio;
});
