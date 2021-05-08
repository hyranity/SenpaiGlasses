import 'package:dio/dio.dart';
import 'package:senpai_glasses/src/models/mangadex/manga.dart';
import 'package:senpai_glasses/src/service/service.dart';

class MangaService extends Service {
  static Future<MangaResponseList> searchByTitle(String title) async {
    var parameter = {"title": title};

    try {
      var res = await Service.dio.get(
        "manga",
        queryParameters: parameter,
      );

      return MangaResponseList.fromJson(res.data);
    } on Exception catch (e) {
      print(e);
    }

    return null;
  }
}
