import 'package:project_fl_bloc/common/values/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _prefs;

  //initialize
  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    //this which means object of _prefs
    return this;
  }

  //create a method to set the values for the key from
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  //function for user token key
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  //get the string try to check user has login or not
  bool getIsLoggedIn() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }
}
