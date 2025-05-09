part of 'forgot_password_bloc.dart';

class ForgotPasswordState {
  ForgotPasswordState clone() {
    return ForgotPasswordState();
  }
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {}

class ForgotPasswordFailed extends ForgotPasswordState {}

class VerifyOtpLoading extends ForgotPasswordState {}

class VerifyOtpSuccess extends ForgotPasswordState {}

class VerifyOtpFailed extends ForgotPasswordState {}

class ResetPasswordLoading extends ForgotPasswordState {}

class ResetPasswordSuccess extends ForgotPasswordState {}

class ResetPasswordFailed extends ForgotPasswordState {}
