import 'package:flutter/material.dart';
import 'package:senpai_glasses/src/common/ui/main_screen.dart';
import 'package:senpai_glasses/src/util/app_settings.dart';

class MainView extends StatefulWidget {
  MainView({Key key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppSettings().theme.background,
      body: MainBody(),
    );
  }
}
