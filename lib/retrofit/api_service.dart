import 'package:dio/dio.dart';
import 'package:lunchtime_frontend/data/sign_in.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../data/user_sign_up.dart';

part 'api_service.g.dart';

class Apis {
  static const String signUp = 'register/';
  static const String signIn = 'login/';
  static const String url1 = 'http://172.16.3.143:8000/api/';
  static const String url2 = 'http://52.90.56.246:8000/api/';
}

@RestApi(baseUrl: Apis.url2)
abstract class ApiClient {
  factory ApiClient(Dio dio, {required String baseUrl}) {
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @POST(Apis.signUp)
  Future<HttpResponse> signUP(@Body() UserSignUp user);

  @POST(Apis.signIn)
  Future<HttpResponse> signIn(@Body() UserSignIn singleUser);

  @GET('register/{id}')
  Future<HttpResponse<UserSignUp>> getUser(@Path('id') int id);
}

final client = ApiClient(
  Dio(
    BaseOptions(contentType: "application/json"),
  ),
  baseUrl: Apis.url2,
);
