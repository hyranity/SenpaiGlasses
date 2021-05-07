import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class Service {
  static String baseUrl = "https://api.mangadex.org/";
  static Dio dio = Dio();

  static setup() {
    dio.options.baseUrl = baseUrl;
  }

  static get(String url) {
    return http.get(Uri.https("api.mangadex.org", url));
  }
}
