import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_match/core/enums/user_role.enum.dart';
import 'package:ride_match/core/resources/data_state.dart';
import 'package:ride_match/features/auth/domain/contracts/auth.repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository repository;
  SignupBloc({ required this.repository }) : super(SignupState()) {
    on<SignupInitEvent>(_init);
    on<Signup>(_signup);
  }

  void _init(SignupInitEvent event, Emitter<SignupState> emit) async {
    emit(state.clone());
  }
  
  void _signup(Signup event, Emitter<SignupState> emit) async {
    emit(SigningUp());
    final result = await repository.register(
      email: event.email,
      password: event.password,
      role: UserRole.passenger.name,
      firstName: event.firstName,
      lastName: event.lastName,
    );
    if (result is DataSuccess) {
      emit(SignupSuccess());
    } else {
      emit(SignupFailed());
    }
  }
}