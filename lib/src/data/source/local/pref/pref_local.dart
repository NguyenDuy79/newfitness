import 'package:shared_preferences/shared_preferences.dart';

class PrefLocal {
  static final PrefLocal _prefLocal = PrefLocal._();
  factory PrefLocal() {
    return _prefLocal;
  }

  PrefLocal._();
  static late SharedPreferences _prefs;
  Future<void> setPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  Future<void> setDouble(String key, double value) async {
    await _prefs.setDouble(key, value);
  }

  Future<void> setStringList(String key, List<String> value) async {
    await _prefs.setStringList(key, value);
  }

  List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  void setBool(String key, bool value) {
    _prefs.setBool(key, value);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  int getInt(String key) {
    return _prefs.getInt(key) ?? 0;
  }

  bool isExistKey(String key) {
    return _prefs.containsKey(key);
  }

  void clearKey(String key) async {
    await _prefs.remove(key);
  }
}
