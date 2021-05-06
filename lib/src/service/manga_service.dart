import 'package:dio/dio.dart';
import 'package:senpai_glasses/src/service/service.dart';

class MangaService extends Service {
  static searchByTitle(String title) {
    var parameter = {"title": title};

    print(Service.options.headers.toString());

    try {
      return Service.dio.get(
        "manga",
        queryParameters: parameter,
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
