import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mrclean/BottomTabs/home_tab.dart';
import 'package:mrclean/BottomTabs/job_tab.dart';
import 'package:mrclean/BottomTabs/notification_tab.dart';
import 'package:mrclean/BottomTabs/settings_tab.dart';
import 'package:mrclean/utils/color.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomeTab(), // Replace with your home page widget
    JobTab(),
    NotificationTab(), // Replace with your notification page widget
    SettingsScreen(), // Replace with your settings page widget
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          gap: 8,
          padding: EdgeInsets.all(16),
          color: Colors.deepPurple,
          tabBackgroundColor: Colors.deepPurple,
          backgroundColor: backgroundcolor,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.work,
              text: 'Job',
            ),
            GButton(
              icon: Icons.notifications_rounded,
              text: 'Notification',
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
            ),
          ]),
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        backgroundColor: backgroundcolor,
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: const Icon(
                Icons.logout_outlined,
              ))
        ],
      ),
      body: _pages[_selectedIndex],
    );
  }
}
