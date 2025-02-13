import 'package:dex_venger/base/base_state.dart';
import 'package:flutter/material.dart';

/// Base state for home page tabs
abstract class BaseHomeState<T extends StatefulWidget> extends BaseState<T> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
}