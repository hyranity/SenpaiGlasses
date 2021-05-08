import 'package:dio/dio.dart';
import 'package:senpai_glasses/src/models/myanimelist/mal_manga.dart';

class MALService {
  String baseUrl = "https://api.jikan.moe/v3/";
  Dio dio = Dio();

  MALService() {
    dio.options.baseUrl = baseUrl;
  }

  Future<MALManga> getManga(String id) async {
    try {
      var res = await dio.get(
        "manga/$id",
      );
      return MALManga.fromJson(res.data);
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
