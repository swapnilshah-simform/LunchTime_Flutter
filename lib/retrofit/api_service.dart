import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../data/feedback_model.dart';
import '../data/user_sign_up.dart';

part 'api_service.g.dart';

class Apis {
  static const String signUp = 'api/register/';
  static const String signIn = 'api/login/';
  static const String feedback = 'api/feedback/';
}

@RestApi(baseUrl: "http://172.16.3.143:8000/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {required String baseUrl}) {
    dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @POST(Apis.signUp)
  Future<HttpResponse<UserSignUp>> signUP(@Body() UserSignUp user);

  @POST(Apis.feedback)
  Future<HttpResponse<FeedbackReview>> feedback(@Body() FeedbackReview feed);
}

final client = ApiClient(
  Dio(
    BaseOptions(contentType: "application/json"),
  ),
  baseUrl: "http://172.16.3.143:8000/",
);
