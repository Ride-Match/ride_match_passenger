
part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginInitEvent extends LoginEvent {}

class Login extends LoginEvent {
  final String email;
  final String password;

  Login({ required this.email, required this.password });
}