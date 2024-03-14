import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:rwid/core/config/injector.dart';
import 'package:rwid/core/config/router.dart';
import 'package:rwid/core/domain/service/supabase_service.dart';
import 'package:rwid/features/auth/bloc/auth_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
        debugShowCheckedModeBanner: false,
        title: 'Articelly',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        routerConfig: routerConfig,
      ),
    );
  }
}
