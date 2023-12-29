import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rwid/core/config/injector.dart';
import 'package:rwid/features/auth/bloc/auth_cubit.dart';
import 'package:rwid/features/auth/page/login_page.dart';
import 'package:rwid/features/dashboard/dashboard_page.dart';

final GlobalKey<NavigatorState> _navigatorKey = locator();
final GoRouter routerConfig = GoRouter(
    navigatorKey: _navigatorKey,
    debugLogDiagnostics: kDebugMode,
    initialLocation: LoginPage.route,
    routes: [
      //SPLASHSCREEN
      /*GoRoute(
        path: Navigator.defaultRouteName,
        builder: (_, __) => const SplashScreen(),
        redirect: (context, GoRouterState state) {
          final app = context.read<AuthenticationBloc>();
          if (app.state.status == AuthenticationStatus.authenticated) {
            return DashboardScreen.route;
          }
          return LoginScreen.route;
        },
      ),*/
      GoRoute(
        path: LoginPage.route,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(supabase: context.read()),
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: DashboardPage.route,
        builder: (context, state) => const DashboardPage(),
      ),
    ]);
