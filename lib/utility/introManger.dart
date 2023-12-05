import 'package:shared_preferences/shared_preferences.dart';

class IntroManager {
  static Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('firstLaunch') ?? true;

    if (isFirstLaunch) {
      await prefs.setBool('firstLaunch', false);
    }

    return isFirstLaunch;
  }
}