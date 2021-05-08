import 'package:flutter/material.dart';
import 'package:senpai_glasses/src/common/manager/navigator_service.dart';
import 'package:senpai_glasses/src/util/page.dart';
import 'package:senpai_glasses/src/util/theme.dart';
import 'package:senpai_glasses/src/views/home.dart';
import 'package:senpai_glasses/src/views/manga_details/manga_details.dart';

class AppSettings with ChangeNotifier {
  static final AppSettings _appSettings = AppSettings._internal();

  factory AppSettings() {
    return _appSettings;
  }

  AppSettings._internal();

  ThemeBase theme;
  String defaultImageUrl = "https://mrb.imgix.net/assets/default-book.png";

  PageBase _currentPage = HomePage();

  BuildContext get context => NavigationService().navigatorKey.currentContext;

  // ! Set to false if not debugging
  bool debug = false;

  bool get isMobile {
    return MediaQuery.of(context).size.width * 0.6 <= 500;
  }

  // All the pages that are to be shown with MainScreen
  List<Widget> headerPages = [
    Home(),
    MangaDetails(),
  ];

  // Navigates to the main screen page and notifies the entire widget tree
  void navigate(PageBase page) {
    _currentPage = page;
    notifyListeners();
  }

  PageBase get currentPage => _currentPage;
}
