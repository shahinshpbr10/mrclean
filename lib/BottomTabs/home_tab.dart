import 'package:flutter/material.dart';
import 'package:mrclean/utils/color.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundcolor,
      body: Center(
          child: Text(
        'Home',
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
