import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ride_match/config/injection/dependency_injection.dart';
import 'package:ride_match/config/route/app_route.dart';
import 'package:ride_match/config/theme/theme.dart';
import 'package:ride_match/config/theme/theme_provider.dart';
import 'package:ride_match/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:ride_match/features/auth/presentation/blocs/forgot_password/forgot_password_bloc.dart';
import 'package:ride_match/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:ride_match/features/auth/presentation/blocs/signup/signup_bloc.dart';
import 'package:ride_match/features/auth/presentation/blocs/verify_otp/verify_otp_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencyInjection();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return 
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => instance<LoginBloc>()),
            BlocProvider(create: (context) => instance<SignupBloc>()),
            BlocProvider(create: (context) => instance<AuthCubit>()),
            BlocProvider(create: (context) => instance<VerifyOtpBloc>()),
            BlocProvider(create: (context) => instance<ForgotPasswordBloc>())
          ],
          child: RepositoryProvider(
            create: (context) => AppRoute(context.read<AuthCubit>()),
            child: ResponsiveSizer(builder: (context, orientation, deviceType) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'Ride Match',
                theme: ThemeClass.lightTheme,
                darkTheme: ThemeClass.darkTheme,
                themeMode: themeProvider.themeMode,
                routerConfig: context.read<AppRoute>().router,
              );
            }),
          ),
        );
  }
}
