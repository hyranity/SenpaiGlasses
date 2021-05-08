import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:senpai_glasses/src/models/mangadex/manga.dart';
import 'package:senpai_glasses/src/models/mangadex/manga_chapters.dart';
import 'package:senpai_glasses/src/models/myanimelist/mal_manga.dart';

class Test {
  static Future<MangaResponse> testManga() async {
    return MangaResponse.fromJson(
        jsonDecode(await rootBundle.loadString('testManga.json')));
  }

  static Future<MALManga> testMALManga() async {
    return MALManga.fromJson(
        jsonDecode(await rootBundle.loadString('testMALManga.json')));
  }

  static Future<MangaChaptersResponseList> testMangaChapters() async {
    return MangaChaptersResponseList.fromJson(
        jsonDecode(await rootBundle.loadString('testMangaChapters.json')));
  }

  static Future<MangaResponseList> testMangaList() async {
    return MangaResponseList.fromJson(
        jsonDecode(await rootBundle.loadString('testMangaList.json')));
  }
}
