import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:senpai_glasses/src/service/manga_service.dart';
import 'package:senpai_glasses/src/util/app.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Senpai Glasses",
                style: GoogleFonts.poppins(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  color: App().theme.accent,
                )),
            SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: App().theme.inputBackground,
              ),
              child: TextField(
                controller: searchController,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: App().theme.primary,
                ),
                onSubmitted: searchManga,
                decoration: InputDecoration(
                    hintText: "Search manga",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: App().theme.primary.withOpacity(0.5),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
