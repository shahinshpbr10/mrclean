import 'package:flutter/material.dart';
import 'package:mrclean/utils/color.dart';

class NotificationTab extends StatelessWidget {
  const NotificationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundcolor,
      body: Center(
          child: Text(
        'Notification tab',
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
