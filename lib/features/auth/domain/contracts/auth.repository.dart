import 'package:ride_match/core/resources/data_state.dart';
import 'package:ride_match/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<DataState<Map<String, dynamic>>> login(
      {required String email, required String password});

  Future<DataState<User>> register(
      {required String email, required String password, required String role, required String firstName, required String lastName});

  Future<DataState<Map<String, dynamic>>> logout({required String email});

  Future<DataState<Map<String, dynamic>>> refreshToken({required String refreshToken});

  Future<DataState<Map<String, dynamic>>> forgotPassword(
      {required String email});

  Future<DataState<Map<String, dynamic>>> resetPassword(
      {required String email, required String password, required String confirmPassword, required String token });

  Future<DataState<Map<String, dynamic>>> verifyEmail(
      {required String email, required int code});
}
