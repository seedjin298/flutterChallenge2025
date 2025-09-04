import 'package:day15/features/main_navigation/main_navigation_screen.dart';
import 'package:day15/settings/views/privacy_screen.dart';
import 'package:day15/settings/views/settings_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/:tab(|search|activity|profile)",
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
