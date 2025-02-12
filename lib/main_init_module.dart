import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../database/my_database.dart';
import '../singleton/shared_prefs_manager.dart';

class MainInitModule {
  // TODO: JAY_LOG - how to separate to background thread?
  Future init() async {
    // Widgets
    WidgetsFlutterBinding.ensureInitialized();

    // Provide database to whole app with GetX
    Get.put(MyDatabase());

    // SharedPrefs
    await SharedPreferencesManager().initialize();
  }
}