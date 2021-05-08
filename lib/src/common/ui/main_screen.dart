import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senpai_glasses/src/common/manager/page_manager.dart';
import 'package:senpai_glasses/src/common/ui/header.dart';

class MainBody extends StatefulWidget {
  MainBody({Key key}) : super(key: key);

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<PageManager>(builder: (context, pageManager, child) {
        return Column(
          children: [
            Header(),
            IndexedStack(
              index: pageManager.currentPageIndex,
              children: PageManager().headerPages,
            ),
          ],
        );
      }),
    );
  }
}
