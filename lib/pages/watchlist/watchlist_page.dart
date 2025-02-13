import 'package:dex_venger/base/base_home_state.dart';
import 'package:flutter/material.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends BaseHomeState<WatchlistPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Center(
      child: Text(s.watchlist),
    );
  }
}