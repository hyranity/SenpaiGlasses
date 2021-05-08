import 'package:flutter/material.dart';
import 'package:senpai_glasses/src/views/home.dart';

class PageManager with ChangeNotifier {
  static final PageManager _singleton = PageManager._internal();

  factory PageManager() {
    return _singleton;
  }

  PageManager._internal();

  int _currentPageIndex = 0;
  List<Widget> headerPages = [
    Home(),
  ];

  set currentPageIndex(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }

  get currentPageIndex => _currentPageIndex;
}
