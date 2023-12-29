import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rwid/features/auth/bloc/auth_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt locator = GetIt.instance;

initInjector() async {
  final SupabaseClient supabase = Supabase.instance.client;
  locator
    ..registerLazySingleton(() => GlobalKey<NavigatorState>())
    ..registerLazySingleton(() => supabase)
    ..registerLazySingleton(() => AuthCubit(supabase: supabase));
}
