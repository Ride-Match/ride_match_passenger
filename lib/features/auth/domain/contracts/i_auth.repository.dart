import 'package:ride_match/core/resources/data_state.dart';
import 'package:ride_match/features/auth/domain/entities/user.dart';

abstract class IAuthRepository {
  Future<DataState<User>> login(
      {required String email, required String password});
}
