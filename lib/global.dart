import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_fl_bloc/common/service/storage_service.dart';

class Global {
  static late StorageService storageService;

  //create a method
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp();

    //make sure that class storageService get initialize
    storageService = await StorageService().init();
  }
}
