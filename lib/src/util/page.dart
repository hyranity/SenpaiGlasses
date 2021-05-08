import 'package:flutter/material.dart';
import 'package:senpai_glasses/src/views/home.dart';
import 'package:senpai_glasses/src/views/manga_details/manga_details.dart';

abstract class PageBase {
  int get pageIndex;
  Widget get pageWidget;
}

class HomePage extends PageBase {
  @override
  int get pageIndex => 0;

  @override
  Widget get pageWidget => Home();
}

class MangaDetailsPage extends PageBase {
  @override
  int get pageIndex => 1;

  @override
  Widget get pageWidget => MangaDetails();
}
