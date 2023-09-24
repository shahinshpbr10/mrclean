import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrclean/job_data.dart';
import 'package:mrclean/utils/color.dart';
import 'package:provider/provider.dart';

class WorkAddingScreen extends StatefulWidget {
  @override
  _WorkAddingScreenState createState() => _WorkAddingScreenState();
}

class _WorkAddingScreenState extends State<WorkAddingScreen> {
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _phonenumController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  String _descriptionError = '';
  String _dateError = '';
  String _locationError = '';
  String _phoneNumberError = '';
  String _nameError = '';

  void _addWork() {
    // Get the values from the text fields
    String description = _descriptionController.text;
    String date = _dateController.text;
    String location = _locationController.text;
    String phonenum = _phonenumController.text;
    String name = _nameController.text;

    // Validate input fields
    if (description.isEmpty) {
      setState(() {
        _descriptionError = 'Description cannot be empty';
      });
      return;
    }

    if (date.isEmpty) {
      setState(() {
        _dateError = 'Date cannot be empty';
      });
      return;
    }

    if (location.isEmpty) {
      setState(() {
        _locationError = 'Location cannot be empty';
      });
      return;
    }
    if (phonenum.isEmpty) {
      setState(() {
        _phoneNumberError = 'Location cannot be empty';
      });
      return;
    }
    if (name.isEmpty) {
      setState(() {
        _nameError = 'Location cannot be empty';
      });
      return;
    }

    // Clear any previous error messages
    setState(() {
      _descriptionError = '';
      _dateError = '';
      _locationError = '';
      _phoneNumberError = '';
    });

    // Access the JobData using Provider and add the work details
    Provider.of<JobData>(context, listen: false)
        .addDescription(description, date, location, phonenum, name);

    // Navigate back to the HomeScreen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        leading: null,
        elevation: 0,
        title: Center(
          child: Text(
            'Provide Information',
            style: GoogleFonts.montserrat(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: mainTextcolor),
          ),
        ),
      ),
      backgroundColor: backgroundcolor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: backgroundcolor,
            boxShadow: [
              BoxShadow(
                  color: Colors.deepPurple.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(0, 3))
            ],
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 1, color: Colors.deepPurple),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Work Description is empty';
                    }
                    return null;
                  },
                  controller: _descriptionController,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      hintText: 'Work Discription',
                      prefixIcon: const Icon(
                        Icons.info_outline_rounded,
                        color: Colors.deepPurple,
                      ),
                      hintStyle:
                          GoogleFonts.montserrat(color: Colors.deepPurple),
                      hoverColor: mainTextcolor,
                      fillColor: mainTextcolor,
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.deepPurple, // Border color when focused
                        ),
                      ),
                      filled: true),
                ),
                Text(
                  _descriptionError,
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'date is empty';
                    }
                    return null;
                  },
                  controller: _dateController,
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      hintText: 'Date of Work',
                      prefixIcon: const Icon(
                        Icons.date_range_rounded,
                        color: Colors.deepPurple,
                      ),
                      hintStyle:
                          GoogleFonts.montserrat(color: Colors.deepPurple),
                      hoverColor: mainTextcolor,
                      fillColor: mainTextcolor,
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.deepPurple, // Border color when focused
                        ),
                      ),
                      filled: true),
                ),
                Text(
                  _dateError,
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _locationController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Location is empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      hintText: 'Location of Work',
                      prefixIcon: const Icon(
                        Icons.location_on_outlined,
                        color: Colors.deepPurple,
                      ),
                      hintStyle:
                          GoogleFonts.montserrat(color: Colors.deepPurple),
                      hoverColor: mainTextcolor,
                      fillColor: mainTextcolor,
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.deepPurple, // Border color when focused
                        ),
                      ),
                      filled: true),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: _phonenumController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'phone number  is empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      hintText: 'Phone Number',
                      prefixIcon: const Icon(
                        Icons.phone_android_rounded,
                        color: Colors.deepPurple,
                      ),
                      hintStyle:
                          GoogleFonts.montserrat(color: Colors.deepPurple),
                      hoverColor: mainTextcolor,
                      fillColor: mainTextcolor,
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.deepPurple, // Border color when focused
                        ),
                      ),
                      filled: true),
                ),
                Text(
                  _phoneNumberError,
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: _nameController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'name  is empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      hintText: 'Cilent Name',
                      prefixIcon: const Icon(
                        Icons.phone_android_rounded,
                        color: Colors.deepPurple,
                      ),
                      hintStyle:
                          GoogleFonts.montserrat(color: Colors.deepPurple),
                      hoverColor: mainTextcolor,
                      fillColor: mainTextcolor,
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.deepPurple, // Border color when focused
                        ),
                      ),
                      filled: true),
                ),
                Text(
                  _nameError,
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: 60.0),
                Container(
                  width: 100,
                  decoration:
                      BoxDecoration(color: Colors.deepPurple, boxShadow: [
                    BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: const Offset(0, 3))
                  ]),
                  child: SizedBox(
                    width: 50,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: mainTextcolor,
                          backgroundColor: Colors.deepPurple),
                      onPressed: _addWork,
                      child: Text('Add Work'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
