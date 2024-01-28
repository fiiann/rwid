import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:rwid/core/config/injector.dart';
import 'package:rwid/core/constant/constant.dart';
import 'package:rwid/core/domain/model/user_rwid.dart';
import 'package:rwid/core/enum/enum.dart';
import 'package:rwid/core/widget/no_page.dart';
import 'package:rwid/features/auth/page/login_page.dart';
import 'package:rwid/features/dashboard/dashboard_page.dart';
import 'package:rwid/features/posts/add_post/bloc/add_post_cubit.dart';
import 'package:rwid/features/posts/add_post/presentation/add_post_page.dart';
import 'package:rwid/features/posts/detail_post/bloc/detail_post_cubit.dart';
import 'package:rwid/features/posts/detail_post/presentation/post_detail_page.dart';
import 'package:rwid/features/posts/list_posts/bloc/posts_cubit.dart';
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
        redirect: (context, GoRouterState state) async {
          final status = await getCurrentAuthentication(context);
          await Future.delayed(const Duration(milliseconds: 100), () {});
          FlutterNativeSplash.remove();
          switch (status) {
            case AuthenticationStatus.unauthenticated:
              return LoginPage.route;
            case AuthenticationStatus.authenticatedWithoutTags:
              return TagPage.route;
            case AuthenticationStatus.authenticatedWithTags:
              //TODO CHANGE TO DASHBOARD
              return DashboardPage.routeName;
          }
        },
      ),
      GoRoute(
          path: DashboardPage.routeName,
          builder: (context, state) => BlocProvider(
                create: (context) =>
                    PostsCubit(supabaseService: context.read()),
                child: const DashboardPage(),
              ),
          routes: [
            GoRoute(
              path: AddPostPage.routePath,
              builder: (context, state) => BlocProvider(
                create: (context) =>
                    AddPostCubit(supabaseService: context.read()),
                child: const AddPostPage(),
              ),
            ),
            GoRoute(
              path: PostDetailPage.routePath,
              builder: (context, state) {
                final id = state.extra;
                if (id != null && id is int) {
                  return BlocProvider(
                    create: (context) =>
                        DetailPostCubit(supabaseService: context.read()),
                    child: PostDetailPage(
                      id: id,
                    ),
                  );
                } else {
                  return const NoPageFound(title: 'ID Detail salah');
                }
              },
            ),
          ]),
      GoRoute(
        path: TagPage.route,
        builder: (context, state) => BlocProvider(
          create: (context) => TagCubit(supabaseService: context.read()),
          child: const TagPage(),
        ),
      ),
    ]);

Future<Session?> getSession(SupabaseClient supabase) async {
  final session = supabase.auth.currentSession;
  return session;
}

void updateUser(Session session) {
  final authBox = Hive.box(authBoxName);

  UserRWID user = UserRWID(
      id: session.user.id,
      name: session.user.userMetadata?['name'] ?? '',
      email: session.user.userMetadata?['email'] ?? '',
      photo: session.user.userMetadata?['avatar_url'] ?? '');
  authBox.put('user', user);
  print('user saved : ${user.toJson()}');
}

Future<int> checkCountTagUser(SupabaseClient supabase) async {
  try {
    final res = await supabase.from('user_tags').select().count();
    final int count = res.count;
    print('user tag count :  $count');
    return count;
  } catch (e) {
    if (kDebugMode) {
      print('error check tag user : ${e.toString()}');
    }
    return 0;
  }
}

Future<AuthenticationStatus> getCurrentAuthentication(
    BuildContext context) async {
  final supabase = context.read<SupabaseClient>();
  final session = await getSession(supabase);

  if (session != null) {
    updateUser(session);
    //TODO CHECK IF USER HAVE BEEN CHOOSE TAG
    final count = await checkCountTagUser(supabase);
    if (count == 0) {
      return AuthenticationStatus.authenticatedWithoutTags;
    } else {
      return AuthenticationStatus.authenticatedWithTags;
    }
  } else {
    return AuthenticationStatus.unauthenticated;
  }
}
