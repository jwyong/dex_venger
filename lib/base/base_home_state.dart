import 'package:dex_venger/generated/l10n.dart';
import 'package:flutter/material.dart';

/// Base state for home page tabs
abstract class BaseHomeState<T extends StatefulWidget> extends State<T> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late final s = S();
}