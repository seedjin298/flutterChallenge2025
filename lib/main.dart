import 'package:day15/router.dart';
import 'package:day15/settings/repo/theme_mode_repo.dart';
import 'package:day15/settings/view_models/theme_mode_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  final repository = ThemeModeRepository(preferences);

  runApp(
    ProviderScope(
      overrides: [
        themeModeProvider.overrideWith(
          () => ThemeModeViewModel(repository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Day 15',
      themeMode: ref.watch(themeModeProvider).darkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      themeAnimationDuration: Duration(milliseconds: 100),
      themeAnimationCurve: Curves.easeInOut,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.blue,
        ),
        splashColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          scrolledUnderElevation: 0.0,
          surfaceTintColor: Colors.white,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        tabBarTheme: TabBarThemeData(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade500,
          indicatorColor: Colors.black,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
        splashColor: Colors.transparent,
        tabBarTheme: TabBarThemeData(
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade500,
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          scrolledUnderElevation: 0.0,
          surfaceTintColor: Colors.grey.shade900,
          backgroundColor: Colors.black,
          actionsIconTheme: IconThemeData(
            color: Colors.grey.shade100,
          ),
          iconTheme: IconThemeData(
            color: Colors.grey.shade100,
          ),
        ),
        bottomAppBarTheme: BottomAppBarThemeData(
          color: Colors.grey.shade900,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.blue,
        ),
      ),
    );
  }
}
