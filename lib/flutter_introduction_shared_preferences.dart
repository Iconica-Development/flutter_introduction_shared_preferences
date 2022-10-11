library flutter_introduction_shared_preferences;

import 'package:flutter_introduction_interface/flutter_introduction_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesIntroductionDataProvider extends IntroductionInterface {
  SharedPreferencesIntroductionDataProvider();

  SharedPreferences? _prefs;
  Future<SharedPreferences> get _preferences async {
    return _prefs ??= await SharedPreferences.getInstance();
  }

  String key = '_completedIntroduction';

  _writeKeyValue(String key, bool value) async {
    (await _preferences).setBool(key, value);
  }

  @override
  Future<void> setCompleted([bool value = true]) async {
    _writeKeyValue(key, value);
  }

  @override
  Future<bool> shouldShow() async {
    return !((await _preferences).getBool(key) ?? false);
  }
}
