import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_match/config/local_storage/local_storage.dart';
import 'package:ride_match/features/auth/domain/contracts/auth.repository.dart';
import 'package:ride_match/features/auth/domain/usecases/login_usecase.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase loginUsecase;
  final AuthRepository repository;
  final LocalStorage localStorage;
  AuthCubit(
      {required this.repository,
      required this.loginUsecase,
      required this.localStorage})
      : super(AuthState());

  Future<void> checkAuth() async {
    emit(Authenticating());
    final token = await localStorage.getToken();
    final refreshToken = await localStorage.getRefreshToken();

    if (token != null && refreshToken != null) {
      emit(Authenticated(token: token, refreshToken: refreshToken));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> authenticat(Authenticated state) async {
    await localStorage.saveToken(state.token);
    await localStorage.saveRefreshToken(state.refreshToken);
    emit(state);
  }

  Future<void> logout() async {
    await localStorage.deleteToken();
    await localStorage.deleteRefreshToken();
    emit(Unauthenticated());
  }
}
