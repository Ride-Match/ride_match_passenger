import 'package:chopper/chopper.dart';
import 'package:ride_match/config/constants/api_url.dart';

part 'auth.service.chopper.dart';

@ChopperApi(baseUrl: ApiUri.auth)
abstract class AuthService extends ChopperService {
  static AuthService create([ChopperClient? client]) => _$AuthService(client);

  @Post(path: '/sign-in')
  Future<Map<String, dynamic>> login(@Body() Map<String, dynamic> body);

  @Post(path: '/sign-up')
  Future<Map<String, dynamic>> register(@Body() Map<String, dynamic> body);

  @Post(path: '/logout')
  Future<Map<String, dynamic>> logout(@Body() Map<String, dynamic> body);

  @Post(path: '/refresh-tokens')
  Future<Map<String, dynamic>> refreshToken(@Body() Map<String, dynamic> body);

  @Post(path: '/forgot-password')
  Future<Map<String, dynamic>> forgotPassword(@Body() Map<String, dynamic> body);

  @Post(path: '/change-password')
  Future<Map<String, dynamic>> resetPassword(@Body() Map<String, dynamic> body);

  @Post(path: '/verify')
  Future<Map<String, dynamic>> verifyEmail(@Body() Map<String, dynamic> body);
}
