import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../models/authenticated_user/authenticated_user_model.dart';
import '../../../services/api/sole_response.dart';


part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @GET("/auth/social/me")
  Future<SoleResponse<AuthenticatedUserModel>> getUserInfo();

  @POST("/auth/social/use-token")
  Future<SoleResponse<AuthenticatedUserModel>> viaSocialToken(
      @Body() Map<String, String> payload);
}
