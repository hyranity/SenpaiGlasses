import 'package:flutter/material.dart';
import 'package:senpai_glasses/src/common/ui/main_screen.dart';
import 'package:senpai_glasses/src/util/app.dart';

class MainView extends StatefulWidget {
  MainView({Key key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: App().theme.background,
      body: MainBody(),
    );
  }
}
