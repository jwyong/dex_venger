import 'package:dex_venger/base/base_home_state.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends BaseHomeState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Center(
      child: Text(s.settings),
    );
  }
}