import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../features/profile_feature/model/user_model.dart';

part 'local_storage_service.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  return throw UnimplementedError();
}

@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref) {
  return LocalStorageService(ref.watch(sharedPreferencesProvider));
}

class LocalStorageService {
  final SharedPreferences _preferences;

  LocalStorageService(this._preferences);

  static const String _betaCodeKey = 'betaCode';
  static const String _passwordKey = 'password';
  static const String _onboardingKey = 'onboarding';
  static const String _authTokenKey = "token";
  static const String _userModelKey = "userModel";
  static const String _formStep = "form_step";
  static const String _userType="userType";



  Future<void> setFormStep({required String formStep})async{
    await _preferences.setString(_formStep, formStep);
  }

  String? getFormStep(){
    final step= _preferences.getString(_formStep);
    return step;
  }



  Future<void> setUserType({required String userType})async{
    await _preferences.setString(_userType, userType);
  }

  String? getUserType(){
    final userType= _preferences.getString(_userType);
    return userType;
  }



  Future<void> setUserModel(UserModel user) async {
    await _preferences.setString(_userModelKey, jsonEncode(user.toJson()));
  }

  UserModel? getUserModel() {
    final userJson = _preferences.getString(_userModelKey);
    return userJson != null ? UserModel.fromJson(jsonDecode(userJson)) : null;
  }

  Future<void> setBetaCode(String betaCode) async {
    await _preferences.setString(_betaCodeKey, betaCode);
  }

  String getBetaCode() {
    final betaCode = _preferences.getString(_betaCodeKey);
    return betaCode ?? "";
  }

  Future<void> setPassword(String password) async {
    await _preferences.setString(_passwordKey, password);
  }

  String getPassword() {
    final password = _preferences.getString(_passwordKey);
    return password ?? "";
  }

  Future<void> setOnboarding() async {
    await _preferences.setBool(_onboardingKey, true);
  }

  bool getOnboarding() {
    return _preferences.getBool(_onboardingKey) ?? false;
  }

  Future<void> setToken(String token) async {
    await _preferences.setString(_authTokenKey, token);
  }

  String getToken() {
    return _preferences.getString(_authTokenKey) ?? "";
  }

  Future<void> clearSession() async {
    _preferences.remove(_userModelKey);
    _preferences.remove(_userType);
    _preferences.remove(_formStep);
  }

  Future<void> clearFormSession() async {
    _preferences.remove(_userType);
    _preferences.remove(_formStep);
  }
}
