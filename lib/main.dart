import 'package:flutter/material.dart';
import 'package:senpai_glasses/src/common/manager/navigator_service.dart';
import 'package:senpai_glasses/src/service/mal_service.dart';
import 'package:senpai_glasses/src/service/manga_service.dart';
import 'package:senpai_glasses/src/util/app_settings.dart';
import 'package:senpai_glasses/src/util/theme.dart';
import 'package:senpai_glasses/src/views/home.dart';
import 'package:senpai_glasses/src/views/main_view.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void main() {
  AppSettings app = AppSettings();

  app.theme = MainTheme();

  runApp(
    ChangeNotifierProvider(
      create: (context) => AppSettings(),
      child: MyApp(),
    ),
  );
}

void setup() {
  locator.registerSingleton<MangadexService>(MangadexService());
  locator.registerSingleton<MALService>(MALService());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: NavigationService().navigatorKey,
      theme: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        primarySwatch: Colors.blue,
      ),
      home: MainView(),
    );
  }
}
