import 'package:get_it/get_it.dart';
import 'package:ride_match/config/local_storage/local_storage.dart';
import 'package:ride_match/config/networking/api_client.dart';
import 'package:ride_match/features/auth/data/data_sources/auth.service.dart';
import 'package:ride_match/features/auth/data/repositories/i_auth.repository.dart';
import 'package:ride_match/features/auth/domain/contracts/auth.repository.dart';
import 'package:ride_match/features/auth/domain/usecases/login_usecase.dart';
import 'package:ride_match/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:ride_match/features/auth/presentation/blocs/forgot_password/forgot_password_bloc.dart';
import 'package:ride_match/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:ride_match/features/auth/presentation/blocs/signup/signup_bloc.dart';
import 'package:ride_match/features/auth/presentation/blocs/verify_otp/verify_otp_bloc.dart';

final instance = GetIt.instance;

Future<void> setupDependencyInjection() async {
  instance.registerSingleton<LocalStorage>(LocalStorage());
  final apiClient = ApiClient();

  // Auth dependencies
  instance.registerSingleton<AuthRepository>(IAuthRepository(apiClient.getChopperService<AuthService>()));
  instance.registerSingleton<LoginUsecase>(LoginUsecase(instance()));
  instance.registerSingleton<AuthCubit>(AuthCubit(repository: instance(), loginUsecase: instance(), localStorage: instance())..checkAuth());
  instance.registerSingleton<LoginBloc>(LoginBloc(repository: instance(), authCubit: instance()));
  instance.registerSingleton<SignupBloc>(SignupBloc(repository: instance()));
  instance.registerSingleton<VerifyOtpBloc>(VerifyOtpBloc(repository: instance()));
  instance.registerSingleton<ForgotPasswordBloc>(ForgotPasswordBloc(repository: instance()));
}