import 'package:dex_venger/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'database/my_database.dart';
import 'main.dart';

part 'main_vm.g.dart';

class MainVM = AMainVM with _$MainVM;

/// TODO: JAY_LOG:
/// - ads: start after listed to store (complete MVP > list > implement adMob)
/// - first time realtimeDB sync issue (vivo, iphone) - permission? check
/// - add realtimeDB sync logics after xx days (1 month?)
/// - check http web call error cases (crash? spammed?)
/// - error handling (snack bars/retry button?)
/// - optimise first time driftDB (check logics, async?)
abstract class AMainVM extends BaseViewModel with Store {
}
