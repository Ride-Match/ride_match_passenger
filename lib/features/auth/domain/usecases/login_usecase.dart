import 'package:ride_match/core/resources/data_state.dart';
import 'package:ride_match/core/usecases/usecase.dart';
import 'package:ride_match/features/auth/domain/contracts/i_auth.repository.dart';
import 'package:ride_match/features/auth/domain/entities/user.dart';

class LoginUsecase extends UseCase<DataState<User>, dynamic> {
  final IAuthRepository _authRepository;
  LoginUsecase(this._authRepository);

  @override
  Future<DataState<User>> call({params}) {
    return this
        ._authRepository
        .login(email: params.email, password: params.password);
  }
}
