import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'local_storage_service.g.dart';
@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  return throw UnimplementedError();
}

@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref) {
  return LocalStorageService(ref.watch(sharedPreferencesProvider));
}

class LocalStorageService{
  final SharedPreferences _preferences;
  LocalStorageService(this._preferences);

  static const String _betaCodeKey = 'betaCode';
  static const String _passwordKey = 'password';

  Future<void> setBetaCode(String betaCode) async{
        await _preferences.setString(_betaCodeKey, betaCode);
  }


String getBetaCode(){
  final betaCode = _preferences.getString(_betaCodeKey);
  return betaCode??"";
}

Future<void> setPassword (String password) async {
  await _preferences.setString(_passwordKey, password);
}

String getPassword(){
  final password = _preferences.getString(_passwordKey);
  return password??"";
}

}