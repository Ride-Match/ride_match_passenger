import 'package:bloc/bloc.dart';

import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<SignupState> emit) async {
    emit(state.clone());
  }
}