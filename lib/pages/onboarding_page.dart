import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrclean/pages/auth_selection_page.dart';
import 'package:mrclean/pages/home_page.dart';
import 'package:mrclean/pages/login_page.dart';
import 'package:mrclean/pages/signup_page.dart';
import 'package:mrclean/utils/color.dart';
import 'package:mrclean/widgets/indro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final showHome = prefs.getBool('showHome') ?? false;
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (showHome) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
    } else if (isLoggedIn) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _navigateToAuthSelection() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => AuthPage(),
    ));
  }

  void _navigateToSignup() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>  SignupPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundcolor,
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            buildPage(
              imageUrl: 'assets/onboardingimage0.json',
              title: 'Home Cleaning',
              subtitle:
                  'Are you tired of spending your precious free time cleaning your home? Let us take the burden off your shoulders with our top-notch house cleaning services. Our team of experienced and trusted cleaners is dedicated to making your home sparkle and shine',
            ),
            buildPage(
              imageUrl: 'assets/onboardingimage1.json',
              title: "Office Cleaning",
              subtitle:
                  'Keep your workspace clean and professional with our comprehensive office cleaning services.Experience a clean, productive workspace. Contact us today!',
            ),
            buildPage(
              imageUrl: 'assets/onboardingimage2.json',
              title: "Car Cleaning",
              subtitle:
                  "Revitalize your ride with our expert car cleaning services.Drive in style with a sparkling clean car. Book your appointment now!",
            )
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              width: double.infinity, // Add this line
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 39, 47, 125),
                  backgroundColor: backgroundcolor,
                  minimumSize: const Size.fromHeight(80),
                ),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', true);
                  _navigateToAuthSelection();
                },
                child: const Text(
                  'Get Started',
                ),
              ),
            )
          : Container(
              color: backgroundcolor,
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      _navigateToAuthSelection();
                    },
                    child: Text(
                      'Skip',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 39, 47, 125),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                  TextButton(
                    onPressed: () => controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    child: Text(
                      'Next',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 39, 47, 125),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
