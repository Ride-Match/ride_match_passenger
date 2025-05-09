import 'package:bloc/bloc.dart';
import 'package:ride_match/core/resources/data_state.dart';
import 'package:ride_match/features/auth/domain/contracts/auth.repository.dart';
import 'package:ride_match/features/auth/presentation/blocs/auth/auth_cubit.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;
  final AuthCubit authCubit;

  LoginBloc({ required this.repository, required this.authCubit }) : super(LoginState()) {
    on<LoginInitEvent>(_init);
    on<Login>(_login);
  }

  void _init(LoginInitEvent event, Emitter<LoginState> emit) async {
    emit(state.clone());
  }

  void _login(Login event, Emitter<LoginState> emit) async {
    emit(LoggingIn());
    final result = await repository.login(email: event.email, password: event.password);

    if (result is DataSuccess) {
      emit(LoginSuccess());
      authCubit.authenticat(Authenticated(
        token: result.data!['accessToken']!,
        refreshToken: result.data!['refreshToken']!
      ));
    } else {
      emit(LoginFailed(error: result.error.toString()));
    }
  }
}
