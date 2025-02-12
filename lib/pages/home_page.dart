import 'package:dex_venger/base/base_state.dart';
import 'package:dex_venger/text_style/text_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> with SingleTickerProviderStateMixin {
  // late final HomePageVM _vm = HomePageVM()..bind(this);

  // Tab bar + bottom nav bar
  // late final BottomNavModule _bottomNavModule = BottomNavModule(_vm);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Text("TESTING 123", style: TextStyles.title.apply(color: Colors.white)),
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
        body: Center(
          child: Text("BODY"),
        ),
        floatingActionButton: FloatingActionButton.small(
            elevation: 0, backgroundColor: Colors.yellowAccent, onPressed: () {}, child: const Icon(Icons.adb)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked);
    // ));
  }
}
