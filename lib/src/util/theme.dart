import 'package:flutter/material.dart';

abstract class ThemeBase {
  Color get background;
  Color get primary;
  Color get accent;
  Color get inputBackground;
}

class MainTheme implements ThemeBase {
  @override
  Color get background => Color(0xff01030f);

  @override
  Color get primary => Colors.white;

  @override
  Color get accent => Color(0xff627cbd);

  @override
  Color get inputBackground => Color(0xff57617a);
}
