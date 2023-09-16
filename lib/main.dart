import 'package:flutter/material.dart';

import 'package:mrclean/pages/onboarding_page.dart';

import 'package:mrclean/pages/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  bool showHome;

  MyApp({super.key, required this.showHome});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: showHome ? SplashScreen() : OnboardingScreen(),
      );
}
