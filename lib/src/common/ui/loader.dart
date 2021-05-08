import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senpai_glasses/src/util/app_settings.dart';

class Loader extends StatelessWidget {
  const Loader({
    Key key,
    @required this.context,
    @required this.text,
  }) : super(key: key);

  final BuildContext context;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text ?? '',
                style: GoogleFonts.poppins(
                  color: AppSettings().theme.primary,
                  fontSize: 25,
                )),
            SizedBox(height: 20),
            CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(
              AppSettings().theme.primary,
            )),
          ],
        ),
      ),
    );
  }
}
