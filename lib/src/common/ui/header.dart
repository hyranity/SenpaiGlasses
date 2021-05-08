import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senpai_glasses/src/util/app.dart';

class Header extends StatefulWidget {
  Header({Key key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  TextEditingController searchController = TextEditingController();

  searchManga(String search) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40),
      margin: EdgeInsets.only(bottom: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          senpaiLogo(),
          Spacer(),
          searchBar(),
        ],
      ),
    );
  }

  Container searchBar() {
    return Container(
      width: 300,
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        color: App().theme.inputBackground,
      ),
      child: TextField(
        controller: searchController,
        textAlign: TextAlign.start,
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: App().theme.primary,
        ),
        onSubmitted: searchManga,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search_outlined,
              color: App().theme.inputText,
            ),
            hintText: "Search manga",
            hintStyle: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: App().theme.inputText,
            )),
      ),
    );
  }

  Row senpaiLogo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Senpai",
          style: GoogleFonts.poppins(
            fontSize: 50,
            fontWeight: FontWeight.w500,
            color: App().theme.primary,
            height: 1,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "Glasses",
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: App().theme.accent,
          ),
        ),
      ],
    );
  }
}
