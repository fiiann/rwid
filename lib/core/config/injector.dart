import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rwid/core/constant/constant.dart';
import 'package:rwid/core/domain/model/user_rwid.dart';
import 'package:rwid/core/domain/service/supabase_service.dart';
import 'package:rwid/features/auth/bloc/auth_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeApp() async {
  await Supabase.initialize(
    url: urlSupabase,
    anonKey: anonKey,
  );
  Hive
    ..initFlutter()
    ..registerAdapter(UserRWIDAdapter());
  await Hive.openBox(authBoxName);
}

initInjector() async {
  final SupabaseClient supabase = Supabase.instance.client;
  locator
    ..registerLazySingleton(() => GlobalKey<NavigatorState>())
    ..registerLazySingleton(() => supabase)
    ..registerLazySingleton<SupabaseService>(() {
      return SupabaseService(client: supabase, box: Hive.box(authBoxName));
    })
    ..registerLazySingleton(
        () => AuthCubit(service: locator(), supabase: locator()));
}
