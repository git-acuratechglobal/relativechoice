import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relative_choice/core/network/apiend_points.dart';
import 'package:relative_choice/core/services/auth_service/auth_service.dart';
import 'package:relative_choice/features/profile_feature/model/user_model.dart';
import '../../network/api_client.dart';
import '../local_storage_service/local_storage_service.dart';

final homeServiceProvider = Provider<HomeService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final localStorageService = ref.watch(localStorageServiceProvider);
  final token = ref.watch(localStorageServiceProvider).getToken();
  return HomeService(apiClient, localStorageService, token);
});

class HomeService {
  final ApiClient _client;
  final LocalStorageService _localStorageService;
  final String _token;
  HomeService(this._client, this._localStorageService, this._token);

  Future<List<User>> getSuggestedMatchesPeoplesList() {
    return asyncGuard(() async {
      final response =
          await _client.get(ApiEndPoints.getMatchingRecords, headers: {
        'Authorization': "Bearer $_token",
      });
      final List<dynamic> userJsonList =
          response.data['matchingRecords']['data'];
      return userJsonList.map((e) => User.fromJson(e)).toList();
    });
  }

  Future<List<User>> getMatchedPeoplesList() {
    return asyncGuard(() async {
      final response = await _client.get(ApiEndPoints.getMatchedList, headers: {
        'Authorization': "Bearer $_token",
      });
      final List<dynamic> userJsonList =
          response.data['connectionsList']['data'];
      return userJsonList.map((e) => User.fromJson(e)).toList();
    });
  }

  Future<String> sendConnectionRequest({required int userId}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.sendConnectionRequest,
          data: FormData.fromMap({'target_user_id': userId}),
          headers: {
            'Authorization': "Bearer $_token",
          });

      return response.data['message'];
    });
  }

  Future<String> cancelSendRequest({required int userId}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.cancelRequest,
          data: FormData.fromMap({'request_id': userId}),
          headers: {
            'Authorization': "Bearer $_token",
          });

      return response.data['message'];
    });
  }

  Future<String> acceptConnectionRequest({required int userId}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.acceptConnectionRequest,
          data: FormData.fromMap({'request_id': userId}),
          headers: {
            'Authorization': "Bearer $_token",
          });

      return response.data['message'];
    });
  }

  Future<String> deleteConnectionRequest({required int userId}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.deleteConnectionRequest,
          data: FormData.fromMap({'request_id': userId}),
          headers: {
            'Authorization': "Bearer $_token",
          });

      return response.data['message'];
    });
  }

  Future<String> removeFromSuggestion({required int userId}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.removeUserFrmSuggestion,
          data: FormData.fromMap({'target_user_id': userId}),
          headers: {
            'Authorization': "Bearer $_token",
          });

      return response.data['message'];
    });
  }

  Future<String> addToMaybeList({required int userId}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.addToMayBeList,
          data: FormData.fromMap({'target_user_id': userId}),
          headers: {
            'Authorization': "Bearer $_token",
          });

      return response.data['message'];
    });
  }

  Future<List<User>> getLikedByMeUsersList() async {
    return asyncGuard(() async {
      final response = await _client.get(ApiEndPoints.likedByMe, headers: {
        'Authorization': "Bearer $_token",
      });
      final List<dynamic> usersJsonList =
          response.data['pending_requests']['data'];

      return usersJsonList.map((e) => User.fromJson(e)).toList();
    });
  }

  Future<List<User>> getLikedMeUsersList() async {
    return asyncGuard(() async {
      final response =
          await _client.get(ApiEndPoints.getLikedByOther, headers: {
        'Authorization': "Bearer $_token",
      });
      final List<dynamic> usersJsonList =
          response.data['pending_requests']['data'];

      return usersJsonList.map((e) => User.fromJson(e)).toList();
    });
  }

  Future<List<User>> getMayBeList() async {
    return asyncGuard(() async {
      final response = await _client.get(ApiEndPoints.getMaybeList, headers: {
        'Authorization': "Bearer $_token",
      });
      final List<dynamic> usersJsonList =
          response.data['wishlist_users']['data'];

      return usersJsonList.map((e) => User.fromJson(e)).toList();
    });
  }

  Future<List<User>> getUsersShowcaseList() async {
    return asyncGuard(() async {
      final response =
          await _client.get(ApiEndPoints.userShowCaseImages, headers: {
        'Authorization': "Bearer $_token",
      });
      final List<dynamic> usersJsonList =
          response.data['connectionsList']['data'];

      return usersJsonList.map((e) => User.fromJson(e)).toList();
    });
  }
}
