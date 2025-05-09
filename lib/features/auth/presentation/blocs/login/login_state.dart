
part of 'login_bloc.dart';

class LoginState {
  LoginState clone() {
    return LoginState();
  }
}

class LoggingIn extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {
  final String error;

  LoginFailed({ required this.error });
}
