import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rwid/core/config/supabase_service.dart';
import 'package:rwid/core/constant/constant.dart';
import 'package:rwid/core/domain/model/user_rwid.dart';
import 'package:rwid/features/auth/bloc/auth_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeApp() async {
  await Supabase.initialize(
    url: 'https://mmvwzkhhtrilohfalocl.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1tdnd6a2hodHJpbG9oZmFsb2NsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDM1OTc0OTEsImV4cCI6MjAxOTE3MzQ5MX0.wpKc3YFPe4VhC2_NJ5Z2lJPM02zfsUHtGAeMoX2HSbk',
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
      return SupabaseService(client: supabase);
    })
    ..registerLazySingleton(() => AuthCubit(service: locator()));
}
