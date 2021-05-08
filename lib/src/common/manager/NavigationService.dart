import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _navigatorService =
      NavigationService._internal();

  factory NavigationService() {
    return _navigatorService;
  }

  NavigationService._internal();

  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
}
