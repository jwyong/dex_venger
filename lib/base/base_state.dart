import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/my_database.dart';
import '../generated/l10n.dart';
import '../singleton/shared_prefs_manager.dart';

/// Base state with convenient functions e.g. disposing mobx or flutter controllers.
abstract class BaseState<T extends StatefulWidget> extends State<T> {
  final List<BaseViewModel> _mobxControllers = List.empty(growable: true);
  final List<Listenable> _controllers = List.empty(growable: true);
  late final s = S();

  static late final SharedPreferences sharedPrefs;

  @override
  void dispose() {
    _mobxControllers.clear();
    super.dispose();
  }
}

class BaseViewModel {
  late final s = S();
  late final MyDatabase database = Get.find<MyDatabase>();
  late final SharedPreferences sharedPrefs = SharedPreferencesManager().sharedPrefs;

  void bind(BaseState baseState) async {
    baseState._mobxControllers.add(this);
  }
}

extension BaseListenable on Listenable {
  void bind(BaseState baseState) {
    baseState._controllers.add(this);
  }
}
