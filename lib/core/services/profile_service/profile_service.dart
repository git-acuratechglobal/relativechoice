import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:relative_choice/core/network/apiend_points.dart';
import 'package:relative_choice/core/services/auth_service/auth_service.dart';

import '../../../features/profile_feature/model/user_model.dart';
import '../../network/api_client.dart';
import '../local_storage_service/local_storage_service.dart';

final profileServiceProvider = Provider<ProfileService>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  final localStorageService = ref.watch(localStorageServiceProvider);
  final token = ref.watch(localStorageServiceProvider).getToken();
  return ProfileService(apiClient, localStorageService, token);
});

class ProfileService {
  final ApiClient _client;
  final LocalStorageService _localStorageService;
  final String _token;
  ProfileService(this._client, this._localStorageService, this._token);

  Future<String> updateProfilePic({XFile? profilePic}) async {
    return asyncGuard(() async {
      if(profilePic==null||profilePic.path.isEmpty){
        throw Exception("Please upload Profile Picture");
      }
      MultipartFile? multipartProfilePic;
      if (profilePic.path.isNotEmpty) {
        multipartProfilePic = await MultipartFile.fromFile(profilePic.path);
      }
      final response = await _client.post(ApiEndPoints.updateProfilePic,
          data: FormData.fromMap(
            {"image": multipartProfilePic},
          ),
          headers: {
            'Authorization': "Bearer $_token",
          });
      return response.data['message'];
    });
  }

  Future<String> addShowcaseImages(
      {required List<Map<String, dynamic>> imageData}) async {
    return asyncGuard(() async {
      if (imageData.isEmpty) return "Please select at least one image";
      var formData = FormData();
      for (var data in imageData) {
        File file = data['file'] as File; // The image file
        String caption = (data['caption'] as TextEditingController)
            .text; // Extract caption text

        formData.files.addAll([
          MapEntry(
            'images[]',
            await MultipartFile.fromFile(file.path,
                filename: file.path.split('/').last),
          ),
          MapEntry(
            'captions[]',
            MultipartFile.fromString(caption),
          ),
        ]);
      }

      final response = await _client
          .post(ApiEndPoints.addShowCaseImages, data: formData, headers: {
        'Authorization': "Bearer $_token",
      });
      return response.data['message'];
    });
  }

  Future<UserModel> getUserProfile() async {
    return asyncGuard(() async {
      final response = await _client.get(ApiEndPoints.profile, headers: {
        'Authorization': "Bearer $_token",
      });
      final userJson = response.data;
      final user = UserModel.fromJson(userJson);
      await _localStorageService.setUserModel(user);
      return user;
    });
  }

  Future<UserModel> getMatchedUserProfile({required int userId}) async {
    return asyncGuard(() async {
      final response = await _client.get(ApiEndPoints.userProfile(userId), headers: {
        'Authorization': "Bearer $_token",
      });
      final json = response.data;
      final user = UserModel.fromJson(json);
      return user;
    });
  }

  Future<UserModel> getUserProfileForUserTypeCheck() async {
    return asyncGuard(() async {
      final response = await _client.get(ApiEndPoints.profile, headers: {
        'Authorization': "Bearer $_token",
      });
      final userJson = response.data;
      final user = UserModel.fromJson(userJson);
      return user;
    });
  }

  Future<String> updatePrompt({required String prompt}) async {
    return asyncGuard(() async {
      final response = await _client.post(ApiEndPoints.updatePrompt,
          data: FormData.fromMap({"story_prompt": prompt},),
          headers: {
            'Authorization': "Bearer $_token",
          }
      );
      final message = response.data['message'];
      return message;
    });
  }
}
