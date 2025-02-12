import 'package:dex_venger/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../base/base_state.dart';
import 'generated/l10n.dart';
import 'main_init_module.dart';
import 'main_vm.dart';
import 'pages/home_page.dart';

// Snack bar key for access anywhere from the app.
final GlobalKey<ScaffoldMessengerState> mainSnackBarKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  await MainInitModule().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends BaseState<MyApp> {
  late final MainVM _vm = MainVM()..bind(this);

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
            home: const HomePage()));
  }
}
