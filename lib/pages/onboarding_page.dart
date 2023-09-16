import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mrclean/pages/home_page.dart';
import 'package:mrclean/utils/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> descriptions = [
    'Office Cleaning',
    'House Cleaning',
    'Car Cleaing'
  ];
  final List<String> imageHeadings = [
    'Office Cleaning',
    'House Cleaning',
    'Car Cleaing'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: descriptions.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPage(
                  imageHeading: imageHeadings[index],
                  description: descriptions[index],
                  imageAsset:
                      'assets/onboardingimage$index.json', // Replace with your image assets
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < descriptions.length; i++)
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 8,
                  width: i == _currentPage ? 24 : 8,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: i == _currentPage ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: mainTextcolor),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => HomePage()));
                  },
                  child: const Text('Skip',
                      style: TextStyle(
                          color: backgroundcolor, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String description;
  final String imageHeading;
  final String imageAsset;

  OnboardingPage(
      {required this.description,
      required this.imageAsset,
      required this.imageHeading});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(imageAsset, width: 400, height: 400),
        SizedBox(height: 10),
        Text(
          description,
          style: GoogleFonts.montserrat(
              fontSize: 25, color: mainTextcolor, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(imageHeading)
      ],
    );
  }
}
