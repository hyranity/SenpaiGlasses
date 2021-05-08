import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senpai_glasses/src/common/ui/loader.dart';
import 'package:senpai_glasses/src/models/mangadex/manga.dart';
import 'package:senpai_glasses/src/models/mangadex/manga_chapters.dart';
import 'package:senpai_glasses/src/models/myanimelist/mal_manga.dart';
import 'package:senpai_glasses/src/util/app_settings.dart';
import 'package:senpai_glasses/src/util/test.dart';
import 'package:transparent_image/transparent_image.dart';

import 'manga_body.dart';

typedef Widget DataFutureBuilder(
    BuildContext context,
    AsyncSnapshot<MALManga> malMangaSnapshot,
    AsyncSnapshot<MangaChaptersResponseList> mangaChaptersResponseList);

class MangaDetails extends StatefulWidget {
  MangaDetails({Key key}) : super(key: key);

  static MangaResponse mangaResponse;

  @override
  _MangaDetailsState createState() => _MangaDetailsState();
}

class _MangaDetailsState extends State<MangaDetails> {
  String savedMangaId;
  Future<MALManga> malManga;
  Future<MangaChaptersResponseList> mangaChaptersResponseList;

  void loadMalManga() async {
    // Only load manga if different ID
    if (!AppSettings().debug &&
        MangaDetails.mangaResponse.data.id != savedMangaId) {
      // TODO: LOAD ACTUAL DATA
      setState(() {
        malManga = Test.testMALManga();
        mangaChaptersResponseList = Test.testMangaChapters();
      });
    }
  }

  void loadTestData() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Loads test data for AppSettings().debug mode
    if (AppSettings().debug) {
      MangaDetails.mangaResponse = await Test.testManga();
      setState(() {
        malManga = Test.testMALManga();
        mangaChaptersResponseList = Test.testMangaChapters();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadTestData();
  }

  @override
  Widget build(BuildContext context) {
    loadMalManga();
    return loadData(
      futureBuilder: (context, malMangaSnapshot, mangaChaptersSnapshot) {
        // Step 1. Load MAL Manga
        if (malMangaSnapshot.connectionState != ConnectionState.done) {
          return Loader(context: context, text: "Loading manga");
        }

        // Step 2. Load Mangadex chapters
        if (mangaChaptersSnapshot.connectionState != ConnectionState.done) {
          return Loader(context: context, text: "Loading chapters");
        }

        // Save manga ID
        savedMangaId = MangaDetails.mangaResponse.data.id;

        return mainBody(context, malMangaSnapshot, mangaChaptersSnapshot);

        // return mainBody(context, malMangaSnapshot);
      },
    );
  }

  Widget loadData({DataFutureBuilder futureBuilder}) {
    // Step 1 - Load MAL manga
    return FutureBuilder<MALManga>(
        future: malManga,
        builder: (context, malMangaSnapshot) {
          // Step 2 - Load Mangadex chapters
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: FutureBuilder<MangaChaptersResponseList>(
                future: mangaChaptersResponseList,
                builder: (context, mangaChaptersSnapshot) {
                  return futureBuilder(
                      context, malMangaSnapshot, mangaChaptersSnapshot);
                }),
          );
        });
  }

  Widget mainBody(
    BuildContext context,
    AsyncSnapshot<MALManga> malMangaSnapshot,
    AsyncSnapshot<MangaChaptersResponseList> chaptersSnapshot,
  ) {
    var malManga = malMangaSnapshot.data;
    var manga = MangaDetails.mangaResponse;
    var chapters = chaptersSnapshot.data.results;

    return MangaBody(malManga: malManga);
  }
}
