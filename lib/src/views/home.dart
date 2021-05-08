import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senpai_glasses/src/service/manga_service.dart';
import 'package:senpai_glasses/src/util/app_settings.dart';
import 'package:senpai_glasses/src/util/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  searchManga(String search) async {
    var response = await MangaService.searchByTitle(search);
    print(response.results.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to",
                style: GoogleFonts.poppins(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  color: AppSettings().theme.primary,
                )),
            Text("Senpai Glasses",
                style: GoogleFonts.poppins(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  color: AppSettings().theme.accent,
                )),
          ],
        ),
      ),
    );
  }
}
