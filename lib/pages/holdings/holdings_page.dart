import 'package:dex_venger/base/base_home_state.dart';
import 'package:flutter/material.dart';

/// Balance
/// Change value / percentage
/// Holdings list (coins in wallet with non-zero balance)
///
class HoldingsPage extends StatefulWidget {
  const HoldingsPage({super.key});

  @override
  State<StatefulWidget> createState() => _HoldingsPage();
}

class _HoldingsPage extends BaseHomeState<HoldingsPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Center(
      child: Text(s.holdings),
    );
  }
}