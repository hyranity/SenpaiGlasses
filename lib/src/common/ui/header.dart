import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senpai_glasses/src/common/ui/search_bar.dart';
import 'package:senpai_glasses/src/util/app_settings.dart';
import 'package:senpai_glasses/src/util/page.dart';
import 'package:senpai_glasses/src/views/home.dart';

class Header extends StatefulWidget {
  Header({Key key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 50),
      alignment: Alignment.topCenter,
      child: Stack(
        children: [
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    senpaiLogo(),
                  ],
                ),
              ),
            ],
          ),
          Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchBar(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget senpaiLogo() {
    return GestureDetector(
      onTap: () => AppSettings().navigate(HomePage()),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Senpai",
            style: GoogleFonts.poppins(
              fontSize: AppSettings().isMobile ? 30 : 50,
              fontWeight: FontWeight.w500,
              color: AppSettings().theme.primary,
              height: 1,
            ),
          ),
          SizedBox(width: 10),
          Text(
            "Glasses",
            style: GoogleFonts.poppins(
              fontSize: AppSettings().isMobile ? 15 : 25,
              fontWeight: FontWeight.w500,
              color: AppSettings().theme.accent,
            ),
          ),
        ],
      ),
    );
  }
}
