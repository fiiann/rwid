import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rwid/core/config/injector.dart';
import 'package:rwid/features/auth/page/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://mmvwzkhhtrilohfalocl.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1tdnd6a2hodHJpbG9oZmFsb2NsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDM1OTc0OTEsImV4cCI6MjAxOTE3MzQ5MX0.wpKc3YFPe4VhC2_NJ5Z2lJPM02zfsUHtGAeMoX2HSbk',
  );
  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider<SupabaseClient>.value(value: locator()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
