import 'package:flutter/material.dart';
import 'package:mrclean/utils/color.dart';

class JobTab extends StatelessWidget {
  const JobTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundcolor,
      body: Center(
          child: Text(
        'JOb tab',
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
