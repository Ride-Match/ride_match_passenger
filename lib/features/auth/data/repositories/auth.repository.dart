import 'package:ride_match/features/auth/data/models/user.dart';
import 'package:ride_match/features/auth/domain/contracts/i_auth.repository.dart';

class AuthRepository extends IAuthRepository {
  Future<UserModel> login({required String email, required String password}) {
    throw UnimplementedError();
  }
}
