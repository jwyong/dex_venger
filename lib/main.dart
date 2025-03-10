import 'package:dex_venger/const/const.dart';
import 'package:dex_venger/pages/add_wallet/add_wallet_page.dart';
import 'package:dex_venger/view_models/wallet_address_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'generated/l10n.dart';
import 'main_init_module.dart';
import 'pages/home_page.dart';

// Snack bar key for access anywhere from the app.
final GlobalKey<ScaffoldMessengerState> mainSnackBarKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  await MainInitModule().init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // TODO: JAY_LOG - add willPopScope for Android back button
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (ctx, child) => MaterialApp(
        scaffoldMessengerKey: mainSnackBarKey,
        title: dexVengerTitle,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: Consumer(
          builder: (context, ref, child) {
            final walletAddress = ref.watch(walletAddressVMProvider);

            return walletAddress == null || walletAddress.isEmpty
                ? AddWalletPage() // Show Add Wallet page
                : HomePage(); // Show TabView
          },
        ),
      ),
    );
  }
}
