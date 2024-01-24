import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:rwid/core/config/injector.dart';
import 'package:rwid/core/constant/constant.dart';
import 'package:rwid/core/domain/model/user_rwid.dart';
import 'package:rwid/features/auth/page/login_page.dart';
import 'package:rwid/features/dashboard/dashboard_page.dart';
import 'package:rwid/features/tag/bloc/tab_cubit.dart';
import 'package:rwid/features/tag/page/tag_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
        builder: (context, state) => const LoginPage(),
        redirect: (context, GoRouterState state) {
          final supabase = context.read<SupabaseClient>();
          // final session = supabase.auth.currentSession;
          // print(session?.user);
          final session = supabase.auth.currentSession;
          final authBox = Hive.box(authBoxName);

          if (session != null) {
            UserRWID user = UserRWID(
                id: session.user.id,
                name: session.user.userMetadata?['name'] ?? '',
                email: session.user.userMetadata?['email'] ?? '',
                photo: session.user.userMetadata?['avatar_url'] ?? '');
            authBox.put('user', user);
            //TODO CHECK IF USER HAVE BEEN CHOOSE TAG
            // return DashboardPage.route;
            return DashboardPage.route;
          } else {
            return null;
          }
          // final auth = context.read<AuthCubit>()
          // Session Management
          // final session = supabase.auth.currentSession;
          // if (session != null) {
          //   return DashboardPage.route;
          // }
        },
      ),
      GoRoute(
        path: DashboardPage.route,
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        path: TagPage.route,
        builder: (context, state) => BlocProvider(
          create: (context) => TagCubit(supabaseService: context.read()),
          child: const TagPage(),
        ),
      ),
    ]);
