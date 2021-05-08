import 'package:flutter/material.dart';
import 'package:senpai_glasses/src/util/app_settings.dart';

class VerticalLine extends StatelessWidget {
  const VerticalLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15),
        VerticalDivider(
          width: 1,
          thickness: 1,
          color: AppSettings().theme.primary,
        ),
        SizedBox(width: 15),
      ],
    );
  }
}
