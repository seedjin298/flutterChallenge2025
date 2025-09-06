import 'package:day15/features/authentication/repo/authentication_repo.dart';
import 'package:day15/features/authentication/views/initial_screen.dart';
import 'package:day15/features/authentication/views/interests_screen.dart';
import 'package:day15/features/authentication/views/login_screen.dart';
import 'package:day15/features/main_navigation/main_navigation_screen.dart';
import 'package:day15/settings/views/privacy_screen.dart';
import 'package:day15/settings/views/settings_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/home",
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.subloc != LoginScreen.routeUrl &&
            state.subloc != InitialScreen.routeUrl) {
          return InitialScreen.routeUrl;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        name: InitialScreen.routeName,
        path: InitialScreen.routeUrl,
        builder: (context, state) => InitialScreen(),
      ),
      GoRoute(
        name: LoginScreen.routeName,
        path: LoginScreen.routeUrl,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        name: InterestsScreen.routeName,
        path: InterestsScreen.routeUrl,
        builder: (context, state) => InterestsScreen(),
      ),
      GoRoute(
        path: "/:tab(home|search|activity|profile)",
        name: MainNavigationScreen.routeName,
        builder: (context, state) {
          final tab = state.params["tab"]!;
          return MainNavigationScreen(tab: tab);
        },
      ),
      GoRoute(
        name: SettingsScreen.routeName,
        path: SettingsScreen.routeUrl,
        builder: (context, state) => SettingsScreen(),
        routes: [
          GoRoute(
            name: PrivacyScreen.routeName,
            path: PrivacyScreen.routeUrl,
            builder: (context, state) => PrivacyScreen(),
          ),
        ],
      ),
    ],
  );
});
