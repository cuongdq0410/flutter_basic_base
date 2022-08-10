import 'package:dio/dio.dart';
import 'package:flutter_basic_base/data/requests/login_request.dart';
import 'package:flutter_basic_base/data/responses/user_response.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@RestApi()
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;

  @POST("/login")
  Future<UserResponse> login(@Body() LoginRequest loginRequest);

  @GET("/refreshToken")
  Future getRefreshToken(@Query("refresh_token") String refreshToken);
}
