library flutter_introduction_shared_preferences;

import 'package:flutter_introduction_interface/flutter_introduction_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesIntroductionDataProvider extends IntroductionInterface {
  SharedPreferencesIntroductionDataProvider();

  _writeKeyValue(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  @override
  Future<void> setCompleted([bool value = true]) async {
    await _writeKeyValue('_completedIntroduction', value.toString());
  }
}
