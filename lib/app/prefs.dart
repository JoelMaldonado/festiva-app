import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  final SharedPreferences _prefs;

  Prefs(this._prefs);

  final String _tokenKey = 'TOKEN_KEY';
  final String _onboardingKey = 'ONBOARDING_KEY';

  Future<void> saveToken(String token) async =>
      await _prefs.setString(_tokenKey, token);
  String? getToken() => _prefs.getString(_tokenKey);
  Future<void> deleteToken() async => await _prefs.remove(_tokenKey);

  Future<void> saveOnboarding(bool onboarding) async =>
      await _prefs.setBool(_onboardingKey, onboarding);
  bool? getOnboarding() => _prefs.getBool(_onboardingKey);
}
