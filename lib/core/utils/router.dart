import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rwid/core/utils/injector.dart';

final GlobalKey<NavigatorState> _navigatorKey = locator();
final GoRouter routerConfig = GoRouter(
    navigatorKey: _navigatorKey,
    debugLogDiagnostics: kDebugMode,
    initialLocation: Navigator.defaultRouteName,
    routes: []);
