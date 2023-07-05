import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _prefs;

  //initialize
  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    //this which means object of _prefs
    return this;
  }
}
