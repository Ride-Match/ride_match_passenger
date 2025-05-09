import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final storage = FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  Future<void> saveRefreshToken(String refreshToken) async {
    await storage.write(key: 'refreshToken', value: refreshToken);
  }

  Future<String?> getRefreshToken() async {
    return await storage.read(key: 'refreshToken');
  }

  Future<void> deleteToken() async {
    await storage.delete(key: 'token');
  }

  Future<void> deleteRefreshToken() async {
    await storage.delete(key: 'refreshToken');
  }
}