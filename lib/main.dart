import 'package:flutter/material.dart';
import 'package:news_application/pages/home_screen/home_screen.dart';
import 'package:news_application/pages/settings_screen/settings_screen.dart';
import 'package:news_application/pages/splash_screen/splash_screen.dart';

import 'core/theme/application_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.theme,
      themeMode: ThemeMode.light,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        HomeView.routeName: (context) => const HomeView(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
      },
    );
  }
}
