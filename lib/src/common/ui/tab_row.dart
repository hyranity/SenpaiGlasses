import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senpai_glasses/src/util/app_settings.dart';

typedef void OnTabSwitch(int index);

class TabRow extends StatefulWidget {
  TabRow({
    Key key,
    @required this.buttonLabels,
    @required this.onTabSwitch,
  }) : super(key: key);

  final List<String> buttonLabels;
  final OnTabSwitch onTabSwitch;

  @override
  _TabRowState createState() => _TabRowState();
}

class _TabRowState extends State<TabRow> with SingleTickerProviderStateMixin {
  TabController controller;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // First button is pressed when built
    widget.onTabSwitch(0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: buildTabRow(),
        ),
      ),
    );
  }

  List<Widget> buildTabRow() {
    List<Widget> tabWidgets = [];

    // To keep track of button index
    int indexCounter = 0;

    widget.buttonLabels.forEach((string) {
      tabWidgets.add(tabWidget(text: string, index: indexCounter));
      indexCounter++;
    });

    return tabWidgets;
  }

  Widget tabWidget({String text, int index}) {
    bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
          widget.onTabSwitch(index);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color:
              isSelected ? AppSettings().theme.background : Colors.transparent,
        ),
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
          top: 15,
          bottom: 15,
        ),
        child: Text(text ?? '',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: AppSettings().theme.primary,
            )),
      ),
    );
  }
}
