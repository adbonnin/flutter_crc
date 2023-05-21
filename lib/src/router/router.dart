import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crc/src/features/create/create_screen.dart';
import 'package:flutter_crc/src/l10n/app_localizations.dart';
import 'package:flutter_crc/src/router/app_bar.dart';
import 'package:flutter_crc/src/router/shell_navigation_view.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final _items = [
  AppBarItem(
    location: CreateScreen.location,
    labelBuilder: (context) => context.loc.release_note_title,
    icon: Icons.book,
  ),
];

final _routes = [
  ShellRoute(
    navigatorKey: _shellNavigatorKey,
    builder: (_, state, child) => ShellNavigationView(
      shellContext: _shellNavigatorKey.currentContext,
      state: state,
      child: child,
    ),
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (_, __) => const NoTransitionPage(
          child: CreateScreen(),
        ),
      ),
    ],
  ),
];

final router = GoRouter(
  initialLocation: CreateScreen.location,
  routes: _routes,
  debugLogDiagnostics: kDebugMode,
  navigatorKey: _rootNavigatorKey,
);
