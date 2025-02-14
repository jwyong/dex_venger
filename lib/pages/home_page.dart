import 'package:dex_venger/base/base_home_state.dart';
import 'package:dex_venger/const/const.dart';
import 'package:dex_venger/pages/holdings/holdings_page.dart';
import 'package:dex_venger/pages/settings/settings_page.dart';
import 'package:dex_venger/pages/watchlist/watchlist_page.dart';
import 'package:dex_venger/text_style/text_styles.dart';
import 'package:dex_venger/view_models/wallet_address_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends BaseHomeState<HomePage> with SingleTickerProviderStateMixin {
  // late final HomePageVM _vm = HomePageVM()..bind(this);

  // Tab bar + bottom nav bar
  // late final BottomNavModule _bottomNavModule = BottomNavModule(_vm);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.deepPurple,
                child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(dexVengerTitle, style: TextStyles.title.apply(color: Colors.white)),
                    )),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 20,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                  ))
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HoldingsPage(),
            WatchlistPage(),
            SettingsPage(),
          ],
        ),
        bottomNavigationBar: TabBar(
          labelColor: Colors.deepPurple,
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(icon: Icon(Icons.account_balance_wallet), text: s.holdings),
            Tab(icon: Icon(Icons.remove_red_eye), text: s.watchlist),
            Tab(icon: Icon(Icons.settings), text: s.settings),
          ],
        ),

        // TODO: JAY_LOG - FAB for chat in future?
        floatingActionButton: FloatingActionButton.small(
          elevation: 0,
          backgroundColor: Colors.redAccent,
          onPressed: () {
            ProviderScope.containerOf(context).read(walletAddressVMProvider.notifier).clearWallet();
          },
          child: const Icon(Icons.logout),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
