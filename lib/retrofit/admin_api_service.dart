import 'package:dio/dio.dart';
import 'package:lunchtime_frontend/data/admin_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';


part 'admin_api_service.g.dart';

class AdminApis {
  static const String menu = 'apimenu/menu/';
}

@RestApi(baseUrl: "http://52.90.56.246:8000/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {required String baseUrl}) {
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @POST(AdminApis.menu)
  Future<HttpResponse> addMenu(@Body() AdminModel user);
}

final client = ApiClient(
  Dio(
    BaseOptions(contentType: "application/json"),
  ),
  baseUrl: "http://52.90.56.246:8000/api/",
);