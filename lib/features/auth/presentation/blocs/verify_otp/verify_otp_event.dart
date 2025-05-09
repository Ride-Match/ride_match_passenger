part of 'verify_otp_bloc.dart';

abstract class VerifyOtpEvent {}

class VerifyOtpInitEvent extends VerifyOtpEvent {}

class VerifyOtp extends VerifyOtpEvent {
  final String email;
  final String otp;

  VerifyOtp({
    required this.email,
    required this.otp,
  });
}