part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent {}

class ForgotPasswordInitEvent extends ForgotPasswordEvent {}

class ForgotPassword extends ForgotPasswordEvent {
  final String email;

  ForgotPassword({ required this.email });
}

class VerifyOtp extends ForgotPasswordEvent {
  final String otp;

  VerifyOtp({ required this.otp });
}

class ResetPassword extends ForgotPasswordEvent {
  final String password;

  ResetPassword({ required this.password });
}
