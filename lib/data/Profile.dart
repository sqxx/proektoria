import 'package:proektoria/data/DirectionType.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile {
  static const _KEY = "PROFILE";

  /// Сохраняет направление профиля
  static saveProfile(DirectionType type) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_KEY, type.index);
  }

  /// Загружает ранее сохранённое направление профиля
  static Future<DirectionType> loadProfile() async {
    var prefs = await SharedPreferences.getInstance();
    return DirectionType.values[prefs.getInt(_KEY)];
  }

  /// Возвращает, был ли профиль сохранён ранее
  static Future<bool> isProfileSaved() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_KEY);
  }
}
