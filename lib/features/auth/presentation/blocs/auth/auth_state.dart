part of 'auth_cubit.dart';

class AuthState {}

class Authenticated extends AuthState {
  final String token;
  final String refreshToken;
  Authenticated({ required this.token, required this.refreshToken });
}

class Unauthenticated extends AuthState {}

class Authenticating extends AuthState {}
