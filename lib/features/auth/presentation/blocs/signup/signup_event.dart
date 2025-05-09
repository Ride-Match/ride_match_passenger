
part of 'signup_bloc.dart';

abstract class SignupEvent {}

class SignupInitEvent extends SignupEvent {}

class Signup extends SignupEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  Signup({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });
}