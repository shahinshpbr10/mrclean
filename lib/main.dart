import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mrclean/data/job_data.dart';

import 'package:mrclean/pages/onboarding_page.dart';

import 'package:mrclean/pages/splash_page.dart';
import 'package:mrclean/settings/account_setting.dart';
import 'package:mrclean/settings/feedback.dart';
import 'package:mrclean/settings/notification_settings.dart';
import 'package:mrclean/settings/privacy_setting.dart';
import 'package:mrclean/settings/terms_and_agreement.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(ChangeNotifierProvider(
      create: (context) => JobData(),
      child: MyApp(
        showHome: showHome,
      )));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  bool showHome;

  MyApp({super.key, required this.showHome});

  @override
  Widget build(BuildContext context) => MaterialApp(
    routes: {
    '/account': (context) =>const  AccountSettingsScreen(),
    '/notifications': (context) => const NotificationsSettingsScreen(),
    '/privacy': (context) =>const  PrivacySettingsScreen(),
    '/terms': (context) =>const  TermsAndAgreementsScreen(),
    '/feedback': (context) =>const  FeedbackScreen(),
  },
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: showHome ? SplashScreen() : const OnboardingScreen(),
      );
}
