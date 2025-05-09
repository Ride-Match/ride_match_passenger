
part of 'signup_bloc.dart';

class SignupState {
  SignupState clone() {
    return SignupState();
  }
}

class SigningUp extends SignupState {}

class SignupSuccess extends SignupState {}

class SignupFailed extends SignupState {}