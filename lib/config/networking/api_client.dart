import 'package:chopper/chopper.dart';
import 'package:ride_match/config/constants/api_url.dart';
import 'package:ride_match/config/interceptor/auth_interceptor.dart';
import 'package:ride_match/features/auth/data/data_sources/auth.service.dart';

class ApiClient {
  late ChopperClient _client;

  ApiClient() {
    createClient();
  }

  T getChopperService<T extends ChopperService>() => _client.getService<T>();

  void createClient() {
    _client = ChopperClient(
        baseUrl: Uri.parse(ApiUri.baseUri),
        converter: JsonConverter(),
        errorConverter: JsonConverter(),
        interceptors: [AuthInterceptor()],
        services: [AuthService.create()]);
  }
}
