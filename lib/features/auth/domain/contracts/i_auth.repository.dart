import 'package:ride_match/features/auth/domain/entities/user.dart';

abstract class IAuthRepository {
  Future<User> login({required String email, required String password});
}
