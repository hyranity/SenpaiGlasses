import 'package:flutter/material.dart';
import 'package:senpai_glasses/src/common/manager/NavigationService.dart';
import 'package:senpai_glasses/src/service/service.dart';
import 'package:senpai_glasses/src/util/app_settings.dart';
import 'package:senpai_glasses/src/util/theme.dart';
import 'package:senpai_glasses/src/views/home.dart';
import 'package:senpai_glasses/src/views/main_view.dart';
import 'package:provider/provider.dart';

void main() {
  AppSettings app = AppSettings();

  app.theme = MainTheme();
  Service.setup();

  runApp(
    ChangeNotifierProvider(
      create: (context) => AppSettings(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: NavigationService().navigatorKey,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MainView(),
    );
  }
}
