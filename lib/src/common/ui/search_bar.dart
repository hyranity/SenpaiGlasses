import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senpai_glasses/src/common/ui/search_result.dart';
import 'package:senpai_glasses/src/models/mangadex/manga.dart';
import 'package:senpai_glasses/src/util/app_settings.dart';
import 'package:senpai_glasses/src/util/test.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController searchController = TextEditingController();

  Future<MangaResponseList> response;

  bool showSearchResult = false;

  Widget searchResultPanel;

  searchManga(String search) async {
    setState(() {
      showSearchResult = true;
      response = Test.testMangaList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          showSearchResult
              ? InkWell(
                  onTap: () => setState(() => showSearchResult = false),
                  child: Container(
                    color: Colors.transparent,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                )
              : SizedBox.shrink(),
          Align(
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                searchBar(context),
                AnimatedSwitcher(
                    duration: Duration(milliseconds: 170),
                    child: searchResultList(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget searchResultList(BuildContext context) {
    if (response == null || !showSearchResult) return SizedBox.shrink();
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        right: 40,
      ),
      width: (MediaQuery.of(context).size.width * 0.25) < 300
          ? 300
          : MediaQuery.of(context).size.width * 0.25,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppSettings().theme.inputBackground,
      ),
      child: FutureBuilder<MangaResponseList>(
          future: response,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return CircularProgressIndicator();
            }

            return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SearchResult(
                  manga: snapshot.data.results[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 20);
              },
              itemCount: snapshot.data.results.length,
            );
          }),
    );
  }

  Container searchBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 40,
        right: 40,
      ),
      width: MediaQuery.of(context).size.width * 0.25,
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        color: AppSettings().theme.inputBackground,
      ),
      child: TextField(
        cursorColor: AppSettings().theme.primary,
        controller: searchController,
        textAlign: TextAlign.start,
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: AppSettings().theme.primary,
        ),
        onSubmitted: searchManga,
        decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            prefixIcon: Icon(
              Icons.search_outlined,
              color: AppSettings().theme.inputText,
            ),
            hintText: "Search manga",
            hintStyle: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: AppSettings().theme.inputText,
            )),
      ),
    );
  }
}
