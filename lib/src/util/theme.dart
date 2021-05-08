import 'package:flutter/material.dart';

abstract class ThemeBase {
  Color get background;
  Color get primary;
  Color get accent;
  Color get inputBackground;
  Color get inputText;
}

class MainTheme implements ThemeBase {
  @override
  Color get background => Color(0xff01030f);

  @override
  Color get primary => Colors.white;

  @override
  Color get accent => Color(0xffFD6543);

  @override
  Color get inputBackground => Color(0xff6E7386);

  @override
  Color get inputText => Color(0xffAFB3C6);
}
