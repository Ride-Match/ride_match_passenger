import 'package:ride_match/core/resources/data_state.dart';
import 'package:ride_match/features/auth/data/data_sources/auth.service.dart';
import 'package:ride_match/features/auth/data/models/user.dart';
import 'package:ride_match/features/auth/domain/contracts/auth.repository.dart';

class IAuthRepository extends AuthRepository {
  final AuthService _authService;

  IAuthRepository(this._authService);

  @override
  Future<DataState<Map<String, dynamic>>> login(
      {required String email, required String password}) async {
    try {
      final result =
          await this._authService.login({"email": email, "password": password});
      return DataSuccess(data: result);
    } catch (e) {
      return DataFailed(error: Exception(e.toString()));
    }
  }

  @override
  Future<DataState<UserModel>> register(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String role}) async {
    try {
      final result = await this._authService.register({
        "email": email,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
        "role": role
      });
      return DataSuccess(data: UserModel.fromJson(result));
    } catch (e) {
      return DataFailed(error: Exception(e.toString()));
    }
  }

  @override
  Future<DataState<Map<String, dynamic>>> logout({required String email}) async {
    try {
      final result = await this._authService.logout({"email": email});
      return DataSuccess(data: result);
    } catch (e) {
      return DataFailed(error: Exception(e.toString()));
    }
  }

  @override
  Future<DataState<Map<String, dynamic>>> refreshToken({required String refreshToken}) async {
    try {
      final result = await this._authService.refreshToken({"refreshToken": refreshToken});
      return DataSuccess(data: result);
    } catch (e) {
      return DataFailed(error: Exception(e.toString()));
    }
  }

  @override
  Future<DataState<Map<String, dynamic>>> forgotPassword(
      {required String email}) async {
    try {
      final result = await this._authService.forgotPassword({"email": email});
      return DataSuccess(data: result);
    } catch (e) {
      return DataFailed(error: Exception(e.toString()));
    }
  }

  @override
  Future<DataState<Map<String, dynamic>>> resetPassword(
      {required String email, required String password, required String confirmPassword, required String token}) async {
    try {
      final result = await this
          ._authService
          .resetPassword({"email": email, "password": password, "confirmPassword": confirmPassword, "token": token});
      return DataSuccess(data: result);
    } catch (e) {
      return DataFailed(error: Exception(e.toString()));
    }
  }

  @override
  Future<DataState<Map<String, dynamic>>> verifyEmail({required String email, required int code}) async {
    try {
      print("------------------------");
      final result = await this._authService.verifyEmail({"email": email, "code": code});
      print(result);
      print("------------------------");
      return DataSuccess(data: result);
    } catch (e) {
      print(e.toString());
      return DataFailed(error: Exception(e.toString()));
    }
  }
}
