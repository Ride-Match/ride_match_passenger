import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ride_match/config/networking/api_client.dart';
import 'package:ride_match/config/route/app_route.dart';
import 'package:ride_match/config/theme/theme.dart';
import 'package:ride_match/config/theme/theme_provider.dart';
import 'package:ride_match/features/auth/data/data_sources/auth.service.dart';
import 'package:ride_match/features/auth/data/repositories/auth.repository.dart';
import 'package:ride_match/features/auth/domain/usecases/login_usecase.dart';
import 'package:ride_match/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:ride_match/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:ride_match/features/auth/presentation/blocs/signup/signup_bloc.dart';

void main() {
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

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ApiClient(),
        ),
        RepositoryProvider(
            create: (context) => AuthRepository(
                context.read<ApiClient>().getChopperService<AuthService>()))
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
              create: (context) => LoginUsecase(context.read<AuthRepository>()))
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => LoginBloc()),
            BlocProvider(create: (context) => AuthCubit(Unauthenticated())),
            BlocProvider(create: (context) => SignupBloc())
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
        ),
      ),
    );
  }
}
