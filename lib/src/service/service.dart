import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class Service {
  static String baseUrl = "https://api.mangadex.org/";
  static Dio dio = Dio();
  static var headers = {
    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    "Access-Control-Allow-Credentials":
        true, // Required for cookies, authorization headers with HTTPS
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS"
  };

  static var options = Options(headers: Service.headers);

  static setup() {
    dio.options.baseUrl = baseUrl;
  }

  static get(String url) {
    return http.get(Uri.https("api.mangadex.org", url));
  }
}
