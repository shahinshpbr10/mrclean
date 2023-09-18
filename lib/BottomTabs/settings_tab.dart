import 'package:flutter/material.dart';
import 'package:mrclean/utils/color.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  TextEditingController namecontroler = TextEditingController();
  TextEditingController addresscontroler = TextEditingController();
  TextEditingController numbercontroler = TextEditingController();
  TextEditingController biocontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundcolor,
      body: Center(
          child: Text(
        'Settings',
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
