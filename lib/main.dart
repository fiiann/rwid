import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rwid/core/config/injector.dart';
import 'package:rwid/core/config/router.dart';
import 'package:rwid/core/domain/service/supabase_service.dart';
import 'package:rwid/features/auth/bloc/auth_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();
  initInjector();
  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider<SupabaseService>.value(value: locator()),
    RepositoryProvider<SupabaseClient>.value(value: locator()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => locator()),
      ],
      child: MaterialApp.router(
        title: 'RWID Medium',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        routerConfig: routerConfig,
      ),
    );
  }
}
