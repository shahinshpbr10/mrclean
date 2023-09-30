import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrclean/utils/color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mrclean/utils/utils.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Stack(
            children: [
              _image != null
                  ? CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(_image!),
                    )
                  : const CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      radius: 64,
                      backgroundImage: AssetImage('assets/usericon.png'),
                    ),
              Positioned(
                bottom: -10,
                left: 80,
                child: IconButton(
                  onPressed: () {
                    selectImage();
                  },
                  icon: const Icon(
                    Icons.add_a_photo,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: ListTile(
                leading: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.deepPurple,
                ),
                title: Text(
                  'Account',
                  style: GoogleFonts.montserrat(color: Colors.deepPurple),
                ),
                onTap: () {
                  // Navigate to the Account settings screen
                  Navigator.of(context).pushNamed('/account');
                },
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: Center(
              child: ListTile(
                leading: Icon(Icons.notifications, color: Colors.deepPurple),
                title: Text('Notifications',
                    style: GoogleFonts.montserrat(color: Colors.deepPurple)),
                onTap: () {
                  // Navigate to the Notifications settings screen
                  Navigator.of(context).pushNamed('/notifications');
                },
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: Center(
              child: ListTile(
                leading: Icon(Icons.lock, color: Colors.deepPurple),
                title: Text('Privacy',
                    style: GoogleFonts.montserrat(color: Colors.deepPurple)),
                onTap: () {
                  // Navigate to the Privacy settings screen
                  Navigator.of(context).pushNamed('/privacy');
                },
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: Center(
              child: ListTile(
                leading: Icon(Icons.description, color: Colors.deepPurple),
                title: Text('Terms and Agreements',
                    style: GoogleFonts.montserrat(color: Colors.deepPurple)),
                onTap: () {
                  // Navigate to the Terms and Agreements screen
                  Navigator.of(context).pushNamed('/terms');
                },
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: Center(
              child: ListTile(
                leading: Icon(Icons.feedback, color: Colors.deepPurple),
                title: Text('Feedback',
                    style: GoogleFonts.montserrat(color: Colors.deepPurple)),
                onTap: () {
                  // Navigate to the Feedback screen
                  Navigator.of(context).pushNamed('/feedback');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
