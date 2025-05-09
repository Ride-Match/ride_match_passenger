
part of 'verify_otp_bloc.dart';

class VerifyOtpState {
  VerifyOtpState clone() {
    return VerifyOtpState();
  }
}

class VerifyingOtp extends VerifyOtpState {}

class VerifyOtpSuccess extends VerifyOtpState {}

class VerifyOtpFailed extends VerifyOtpState {}