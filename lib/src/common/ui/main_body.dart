import 'package:flutter/material.dart';
import 'package:senpai_glasses/src/common/manager/page_manager.dart';
import 'package:senpai_glasses/src/common/ui/header.dart';

class MainBody extends StatefulWidget {
  MainBody({Key key}) : super(key: key);

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Header(),
          IndexedStack(
            index: pageIndex,
            children: PageManager.headerPages,
          ),
        ],
      ),
    );
  }
}
