import 'package:flutter/material.dart';
import 'package:senpai_glasses/src/util/theme.dart';

class App {
  static final App _singleton = App._internal();

  factory App() {
    return _singleton;
  }

  App._internal();

  ThemeBase theme;
}
