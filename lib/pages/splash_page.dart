import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mrclean/pages/auth_selection_page.dart';
import 'package:mrclean/pages/home_page.dart';

import 'package:mrclean/pages/onboarding_page.dart';
import 'package:mrclean/utils/color.dart';
import 'package:mrclean/widgets/text_with_lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _splashDuration = const Duration(seconds: 6);

  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  void _navigateToNextPage() {
    Timer(_splashDuration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => AuthPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/mr.clean-removebg.png', // Replace with your image asset
              width: 400, // Adjust the width as needed
              height: 400,
              color: mainTextcolor, // Adjust the height as needed
            ),
            const SizedBox(height: 80),
            const TextWithLottieAnimation(),
          ],
        ),
      ),
    );
  }
}
