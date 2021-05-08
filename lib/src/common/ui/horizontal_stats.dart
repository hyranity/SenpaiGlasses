import 'package:flutter/material.dart';
import 'package:senpai_glasses/src/common/ui/vertical_line.dart';

class HorizontalStats extends StatelessWidget {
  const HorizontalStats({Key key, @required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: buildRow(),
      ),
    );
  }

  List<Widget> buildRow() {
    List<Widget> row = [];

    int widgetCounter = 0;

    children.forEach((widget) {
      widgetCounter++;
      row.add(widget);

      // If this is not the last widget, add divider
      if (widgetCounter != children.length) row.add(VerticalLine());
    });

    return row;
  }
}
