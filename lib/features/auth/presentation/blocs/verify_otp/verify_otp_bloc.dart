import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_match/core/resources/data_state.dart';
import 'package:ride_match/features/auth/domain/contracts/auth.repository.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final AuthRepository repository;
  VerifyOtpBloc({ required this.repository }) : super(VerifyOtpState()) {
    on<VerifyOtpInitEvent>(_init);
    on<VerifyOtp>(_verifyOtp);
  }

  void _init(VerifyOtpInitEvent event, Emitter<VerifyOtpState> emit) async {
    emit(state.clone());
  }
  
  void _verifyOtp(VerifyOtp event, Emitter<VerifyOtpState> emit) async {
    emit(VerifyingOtp());
    final result = await repository.verifyEmail(
      email: event.email,
      code: int.parse(event.otp),
    );
    if (result is DataSuccess) {
      emit(VerifyOtpSuccess());
    } else {
      emit(VerifyOtpFailed());
    }
  }
}