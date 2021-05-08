import 'package:flutter/material.dart';

abstract class ThemeBase {
  Color get background;
  Color get primary;
  Color get accent;
  Color get inputBackground;
  Color get inputText;
  Color get blurColor;
  Color get volumeBox;
  Map<String, Color> get countryTextColors;
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

  @override
  Color get blurColor => Color(0xff191836);

  @override
  Color get volumeBox => Color(0xff505C7B);

  @override
  Map<String, Color> get countryTextColors => {
        "en": Color(0xff637B50),
        "ru": Color(0xff2B41B2),
      };
}
