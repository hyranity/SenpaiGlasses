import 'package:dio/dio.dart';
import 'package:senpai_glasses/src/models/mangadex/manga.dart';
import 'package:senpai_glasses/src/models/mangadex/manga_chapters.dart';
import 'package:senpai_glasses/src/service/mal_service.dart';

class MangadexService {
  String baseUrl = "https://api.mangadex.org/";
  Dio dio = Dio();

  MangadexService() {
    dio.options.baseUrl = baseUrl;
  }

  Future<MangaResponseList> searchByTitle(String title) async {
    var parameter = {"title": title};
    try {
      var res = await dio.get(
        "manga",
        queryParameters: parameter,
      );
      return MangaResponseList.fromJson(res.data);
    } on Exception catch (e) {
      print(e);
    }

    return null;
  }

  Future<MangaChaptersResponseList> getMangaChapters(String id) async {
    var parameter = {
      "manga": id,
      "order[publishAt]": "desc",
    };

    try {
      var res = await dio.get(
        "chapter",
        queryParameters: parameter,
      );
      return MangaChaptersResponseList.fromJson(res.data);
    } on Exception catch (e) {
      print(e);
    }

    return null;
  }

  Future<MangaResponse> getManga(String id) async {
    var res = await dio.get(
      "manga/$id",
    );
    return MangaResponse.fromJson(res.data);
  }
}
