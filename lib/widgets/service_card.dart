import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrclean/utils/color.dart';

class ServiceCard extends StatelessWidget {
  final String imagePath;
  final String labelText;
  const ServiceCard({
    super.key,
    required this.imagePath,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: mainTextcolor,
      ),
      height: 150,
      width: double.infinity,
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 110,
            height: 120,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            labelText,
            style: GoogleFonts.montserrat(
                fontSize: 25, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
