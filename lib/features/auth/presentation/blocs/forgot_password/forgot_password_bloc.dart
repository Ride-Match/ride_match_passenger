import 'package:bloc/bloc.dart';
import 'package:ride_match/features/auth/domain/contracts/auth.repository.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepository repository;

  String email = '';

  ForgotPasswordBloc({ required this.repository }) : super(ForgotPasswordState()) {
    on<ForgotPasswordInitEvent>(_init);
  }

  void _init(ForgotPasswordInitEvent event, Emitter<ForgotPasswordState> emit) async {
    emit(state.clone());
  }
}
