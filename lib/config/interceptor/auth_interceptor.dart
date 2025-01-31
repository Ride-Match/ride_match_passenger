import 'dart:async';

import 'package:chopper/chopper.dart';

class AuthInterceptor implements Interceptor {
  final String token = 'token';

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
      Chain<BodyType> chain) async {
    final request =
        applyHeader(chain.request, 'Authorization', 'Bearer $token');
    return chain.proceed(request);
  }
}
