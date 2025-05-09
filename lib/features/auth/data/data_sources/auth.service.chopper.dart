// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$AuthService extends AuthService {
  _$AuthService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = AuthService;

  @override
  Future<Map<String, dynamic>> login(Map<String, dynamic> body) async {
    final Uri $url = Uri.parse('auth/sign-in');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    final Response $response =
        await client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
    return $response.bodyOrThrow;
  }

  @override
  Future<Map<String, dynamic>> register(Map<String, dynamic> body) async {
    final Uri $url = Uri.parse('auth/sign-up');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    final Response $response =
        await client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
    return $response.bodyOrThrow;
  }

  @override
  Future<Map<String, dynamic>> logout(Map<String, dynamic> body) async {
    final Uri $url = Uri.parse('auth/logout');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    final Response $response =
        await client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
    return $response.bodyOrThrow;
  }

  @override
  Future<Map<String, dynamic>> refreshToken(Map<String, dynamic> body) async {
    final Uri $url = Uri.parse('auth/refresh-tokens');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    final Response $response =
        await client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
    return $response.bodyOrThrow;
  }

  @override
  Future<Map<String, dynamic>> forgotPassword(Map<String, dynamic> body) async {
    final Uri $url = Uri.parse('auth/forgot-password');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    final Response $response =
        await client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
    return $response.bodyOrThrow;
  }

  @override
  Future<Map<String, dynamic>> resetPassword(Map<String, dynamic> body) async {
    final Uri $url = Uri.parse('auth/change-password');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    final Response $response =
        await client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
    return $response.bodyOrThrow;
  }

  @override
  Future<Map<String, dynamic>> verifyEmail(Map<String, dynamic> body) async {
    final Uri $url = Uri.parse('auth/verify');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    final Response $response =
        await client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
    return $response.bodyOrThrow;
  }
}
