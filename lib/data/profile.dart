import 'package:proektoria/data/direction_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile {
  static const _KEY = "PROFILE";

  static saveProfile(DirectionType type) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_KEY, type.index);
  }

  static Future<DirectionType> loadProfile() async {
    var prefs = await SharedPreferences.getInstance();
    return DirectionType.values[prefs.getInt(_KEY)];
  }

  static Future<bool> isProfileSaved() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_KEY);
  }
}
