import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senpai_glasses/src/common/ui/header.dart';
import 'package:senpai_glasses/src/util/app_settings.dart';

class MainBody extends StatefulWidget {
  MainBody({Key key}) : super(key: key);

  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Consumer<AppSettings>(builder: (context, pageManager, child) {
          return Stack(
            children: [
              Column(
                children: [AppSettings().currentPage.pageWidget],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Header(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
