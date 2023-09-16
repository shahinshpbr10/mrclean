import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrclean/utils/color.dart';

class TextWithLottieAnimation extends StatelessWidget {
  const TextWithLottieAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Cleaning is a practice.Not a project...',
                textAlign: TextAlign.center,
                textStyle: GoogleFonts.caveat(
                  fontSize: 26,
                  color: mainTextcolor,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 80),
              ),
            ],
            totalRepeatCount: 1,
            pause: const Duration(seconds: 1),
            displayFullTextOnTap: true,
          ),
        ],
      ),
    );
  }
}
