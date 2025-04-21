import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relative_choice/auth_feature/params/sign_up_params.dart';
import 'package:relative_choice/core/network/api_client.dart';
import 'package:relative_choice/core/network/apiend_points.dart';
import 'package:relative_choice/core/services/local_storage_service/local_storage_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final localStorageService = ref.watch(localStorageServiceProvider);
  return AuthService(apiClient, localStorageService);
});

class AuthService {
  final ApiClient _client;
  final LocalStorageService _localStorageService;
  AuthService(this._client, this._localStorageService);

  Future<String> sendBetaCode({required String betaCode}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.betaCode,
          data: FormData.fromMap({"code": betaCode}));
      await _localStorageService.setBetaCode(betaCode);
      return response.data['message'];
    });
  }

  Future<String> isEmailExist({required String emailAddress}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.emailAddress,
          data: FormData.fromMap({'email': emailAddress}));
      return response.data['message'];
    });
  }

  Future<String> sendOtp({required String email}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.otp,
          data: FormData.fromMap({'email': email}));
      return response.data['message'];
    });
  }

  Future<String> matchOtp({required String otp, required String email}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.matchOtp,
          data: FormData.fromMap({'email': email, 'otp': otp}));
      return response.data['message'];
    });
  }

    Future<String> register({required SignupParams params}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.register,
          data: FormData.fromMap(params.toJson()));
      return response.data['message'];
    });
  }

  Future<Response> asyncGuard<Response>(
      Future<Response> Function() apiCall) async {
    try {
      return await apiCall();
    } on CheckedFromJsonException catch (e) {
      throw "Something went wrong! ${e.toString()}"
          .replaceAll("CheckedFromJsonException", "");
    } on FormatException catch (e) {
      throw "Unable to process data from server. reason: ${e.message}";
    } catch (e) {
      rethrow;
    }
  }
}
