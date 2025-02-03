import 'package:ride_match/core/resources/data_state.dart';
import 'package:ride_match/features/auth/data/data_sources/auth.service.dart';
import 'package:ride_match/features/auth/data/models/user.dart';
import 'package:ride_match/features/auth/domain/contracts/i_auth.repository.dart';

class AuthRepository extends IAuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  @override
  Future<DataState<UserModel>> login(
      {required String email, required String password}) async {
    try {
      final result =
          await this._authService.login({"email": email, "password": password});
      return DataSuccess(data: UserModel.fromJson(result));
    } catch (e) {
      return DataFailed(error: e as Exception);
    }
  }
}
