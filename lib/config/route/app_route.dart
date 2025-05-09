import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:ride_match/config/route/go_router_refresh_stream.dart';
import 'package:ride_match/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:ride_match/features/auth/presentation/pages/login_page.dart';
import 'package:ride_match/features/auth/presentation/pages/otp_page.dart';
import 'package:ride_match/features/auth/presentation/pages/signup_page.dart';
import 'package:ride_match/features/auth/presentation/pages/splash_page.dart';
import 'package:ride_match/features/trip/presentation/pages/map_page.dart';

class AppRoute {
  GlobalKey<NavigatorState> parentKey = GlobalKey<NavigatorState>();

  late GoRouter router;

  AppRoute(AuthCubit authCubit) {
    router = getRouter(authCubit);
  }

  GoRouter getRouter(AuthCubit authCubit) {
    return GoRouter(
      initialLocation: "/",
      navigatorKey: parentKey,
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) => MapPage(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) {
            return LoginPage();
          },
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) {
            return SignupPage();
          },
        ),
        GoRoute(
          path: '/splash',
          builder: (context, state) {
            return SplashPage();
          },
        ),
        GoRoute(
          path: '/otp',
          builder: (context, state) {
            final email = state.uri.queryParameters['email'];
            return OtpPage(email: email ?? '');
          },
        )
      ],
      redirect: (context, state) {
        final unauthenticated = authCubit.state is Unauthenticated;
        final authenticating = authCubit.state is Authenticating;
        final loggedIn = authCubit.state is Authenticated;
        final loggingIn =
            state.fullPath == '/login' || state.fullPath == '/splash';
        final authPages = [
          '/login',
          '/signup',
          '/otp',
        ];

        if (authenticating && !loggingIn) return '/splash';

        if (unauthenticated && !authPages.contains(state.fullPath)) {
          return '/login';
        }

        if (loggedIn && loggingIn) {
          return '/';
        }

        return null;
      },
      refreshListenable: GoRouterRefreshStream(authCubit.stream),
    );
  }
}
