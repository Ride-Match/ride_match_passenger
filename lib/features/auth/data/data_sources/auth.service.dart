import 'package:chopper/chopper.dart';
import 'package:ride_match/config/constants/api_url.dart';

part 'auth.service.chopper.dart';

@ChopperApi(baseUrl: ApiUrl.auth)
abstract class AuthService extends ChopperService {
  static AuthService create(ChopperClient client) => _$AuthService(client);

  @Post(path: '/login')
  Future<Map<String, String>> login(@Body() Map<String, String> body);
}
