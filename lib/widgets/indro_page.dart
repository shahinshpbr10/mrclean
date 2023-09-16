import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mrclean/utils/color.dart';

Widget buildPage({
  required String imageUrl,
  required String title,
  required String subtitle,
}) =>
    Container(
      color: backgroundcolor,
      child: Column(
        children: [
          Lottie.asset(
            imageUrl,
            width: 400,
            height: 400,
          ),
          Text(
            title,
            style: GoogleFonts.montserrat(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: mainTextcolor),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              subtitle,
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: mainTextcolor),
            ),
          )
        ],
      ),
    );
