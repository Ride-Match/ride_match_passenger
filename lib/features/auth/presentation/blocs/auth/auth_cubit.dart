import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(AuthState initialState) : super(initialState);

  authenticat(AuthState state) {
    emit(state);
  }
}
