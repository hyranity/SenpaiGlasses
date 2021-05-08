import 'package:flutter/material.dart';
import 'package:senpai_glasses/src/common/ui/loader.dart';
import 'package:senpai_glasses/src/models/mangadex/manga.dart';
import 'package:senpai_glasses/src/models/mangadex/manga_chapters.dart';
import 'package:senpai_glasses/src/models/myanimelist/mal_manga.dart';
import 'package:senpai_glasses/src/service/manga_service.dart';
import 'package:senpai_glasses/src/service/mal_service.dart';
import 'package:senpai_glasses/src/util/app_settings.dart';
import 'package:senpai_glasses/src/util/test.dart';

import 'manga_body.dart';

typedef Widget DataFutureBuilder(
    BuildContext context,
    AsyncSnapshot<MALManga> malMangaSnapshot,
    AsyncSnapshot<MangaResponse> mangaResponseSnapshot,
    AsyncSnapshot<MangaChaptersResponseList> mangaChaptersResponseList);

class MangaDetails extends StatefulWidget {
  MangaDetails({Key key}) : super(key: key);

  static String mangaId;

  @override
  _MangaDetailsState createState() => _MangaDetailsState();
}

class _MangaDetailsState extends State<MangaDetails> {
  String savedMangaId;
  String loaderText;

  int loaderProgress = 0;

  bool isLoading = false;

  MALManga malManga;
  MangaChaptersResponseList mangaChaptersResponseList;
  MangaResponse mangaResponse;

  double mangaBodyHeight = 0;

  void loadApiData() async {
    if (isLoading) return;
    isLoading = true;
    mangaResponse = await MangadexService().getManga(MangaDetails.mangaId);

    setState(() => loaderProgress = 1);

    // Save manga ID
    savedMangaId = mangaResponse.data.id;

    if (mangaResponse.data.attributes.links != null &&
        mangaResponse.data.attributes.links.mal != null) {
      malManga =
          await MALService().getManga(mangaResponse.data.attributes.links.mal);

      setState(() => loaderProgress = 2);
    }

    mangaChaptersResponseList =
        await MangadexService().getMangaChapters(mangaResponse.data.id);

    isLoading = false;
    setState(() => loaderProgress = 3);
  }

  void loadTestData() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Loads test data for AppSettings().debug mode
    if (AppSettings().debug) {
      mangaResponse = await Test.testManga();
      malManga = await Test.testMALManga();
      mangaChaptersResponseList = await Test.testMangaChapters();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    loadApiData();
  }

  @override
  Widget build(BuildContext context) {
    // We put in build because initState is not called if user selects another manga while this screen is on
    if (!AppSettings().debug && MangaDetails.mangaId != savedMangaId)
      loadApiData();

    switch (loaderProgress) {
      case 0:
        return Loader(context: context, text: "Loading manga from MangaDex");
        break;
      case 1:
        return Loader(context: context, text: "Loading data from MyAnimeList");
        break;
      case 2:
        return Loader(context: context, text: "Loading chapters from MangaDex");
        break;
      default:
        return mainBody();
    }
    // return loadData(
    //   futureBuilder: (context, malMangaSnapshot, mangaResponseSnapshot,
    //       mangaChaptersSnapshot) {
    //     // Step 1. Load MAL Manga
    //     if (malMangaSnapshot.connectionState != ConnectionState.done) {
    //       return Loader(context: context, text: "Loading manga from MAL");
    //     }

    //     // Step 2. Load Mangadex manga
    //     if (mangaResponseSnapshot.connectionState != ConnectionState.done) {
    //       return Loader(context: context, text: "Loading manga from Mangadex");
    //     }

    //     // Step 3. Load Mangadex chapters
    //     if (mangaChaptersSnapshot.connectionState != ConnectionState.done) {
    //       return Loader(
    //           context: context, text: "Loading chapters from Mangadex");
    //     }

    //     return mainBody(context, malMangaSnapshot, mangaResponseSnapshot,
    //         mangaChaptersSnapshot);

    //     // return mainBody(context, malMangaSnapshot);
    //   },
    // );
  }

  // Widget loadData({DataFutureBuilder futureBuilder}) {
  //   // Step 1 - Load MAL manga
  //   return FutureBuilder<MALManga>(
  //       future: malManga,
  //       builder: (context, malMangaSnapshot) {
  //         // Step 2 - Load Mangadex manga
  //         return FutureBuilder<MangaResponse>(
  //             future: mangaResponse,
  //             builder: (context, mangaResponseSnapshot) {
  //               // Step 3 - Load Mangadex chapters
  //               return FutureBuilder<MangaChaptersResponseList>(
  //                   future: mangaChaptersResponseList,
  //                   builder: (context, mangaChaptersSnapshot) {
  //                     return futureBuilder(context, malMangaSnapshot,
  //                         mangaResponseSnapshot, mangaChaptersSnapshot);
  //                   });
  //             });
  //       });
  // }

  Widget mainBody() {
    return MangaBody(
      malManga: malManga,
      manga: mangaResponse.data.attributes,
      chapters: mangaChaptersResponseList,
    );
  }
}
