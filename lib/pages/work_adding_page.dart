import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mrclean/data/job_data.dart';
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
    String? description = _descriptionController.text;
    String? date = _dateController.text;
    String? location = _locationController.text;
    String? phonenum = _phonenumController.text;
    String? name = _nameController.text;

    // Validate input fields
    if (description?.isEmpty ?? true) {
      setState(() {
        _descriptionError = 'Description cannot be empty';
      });
      return;
    }

    if (date?.isEmpty ?? true) {
      setState(() {
        _dateError = 'Date cannot be empty';
      });
      return;
    }

    if (location?.isEmpty ?? true) {
      setState(() {
        _locationError = 'Location cannot be empty';
      });
      return;
    }
    if (phonenum?.isEmpty ?? true) {
      setState(() {
        _phoneNumberError = 'Phone number cannot be empty';
      });
      return;
    }
    if (name?.isEmpty ?? true) {
      setState(() {
        _nameError = 'Name cannot be empty';
      });
      return;
    }

    // Clear any previous error messages
    setState(() {
      _descriptionError = '';
      _dateError = '';
      _locationError = '';
      _phoneNumberError = '';
      _nameError = '';
    });

    // Access the JobData using Provider and add the work details
    Provider.of<JobData>(context, listen: false)
        .addDescription(description!, date!, location!, phonenum!, name!);

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
      body: Container(
        width: double.infinity, // Full-width container
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: mainTextcolor, // Change to your desired background color
          borderRadius: BorderRadius.circular(30), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Lottie.asset('assets/addwork.json', width: 150, height: 150),
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
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'Work Description',
                prefixIcon: const Icon(
                  Icons.info_outline_rounded,
                  color: Colors.deepPurple,
                ),
                hintStyle: GoogleFonts.montserrat(color: Colors.deepPurple),
                hoverColor: mainTextcolor,
                fillColor: mainTextcolor,
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.deepPurple, // Border color when focused
                  ),
                ),
                filled: true,
                errorText:
                    _descriptionError.isNotEmpty ? _descriptionError : null,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Date is empty';
                }
                return null;
              },
              controller: _dateController,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'Date of Work',
                prefixIcon: const Icon(
                  Icons.date_range_rounded,
                  color: Colors.deepPurple,
                ),
                hintStyle: GoogleFonts.montserrat(color: Colors.deepPurple),
                hoverColor: mainTextcolor,
                fillColor: mainTextcolor,
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.deepPurple, // Border color when focused
                  ),
                ),
                filled: true,
                errorText: _dateError.isNotEmpty ? _dateError : null,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Location is empty';
                }
                return null;
              },
              controller: _locationController,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'Location of Work',
                prefixIcon: const Icon(
                  Icons.location_on_outlined,
                  color: Colors.deepPurple,
                ),
                hintStyle: GoogleFonts.montserrat(color: Colors.deepPurple),
                hoverColor: mainTextcolor,
                fillColor: mainTextcolor,
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.deepPurple, // Border color when focused
                  ),
                ),
                filled: true,
                errorText: _locationError.isNotEmpty ? _locationError : null,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Phone number is empty';
                }
                return null;
              },
              controller: _phonenumController,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'Phone Number',
                prefixIcon: const Icon(
                  Icons.phone_android_rounded,
                  color: Colors.deepPurple,
                ),
                hintStyle: GoogleFonts.montserrat(color: Colors.deepPurple),
                hoverColor: mainTextcolor,
                fillColor: mainTextcolor,
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.deepPurple, // Border color when focused
                  ),
                ),
                filled: true,
                errorText:
                    _phoneNumberError.isNotEmpty ? _phoneNumberError : null,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Name is empty';
                }
                return null;
              },
              controller: _nameController,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'Client Name',
                prefixIcon: const Icon(
                  Icons.person_outline,
                  color: Colors.deepPurple,
                ),
                hintStyle: GoogleFonts.montserrat(color: Colors.deepPurple),
                hoverColor: mainTextcolor,
                fillColor: mainTextcolor,
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.deepPurple, // Border color when focused
                  ),
                ),
                filled: true,
                errorText: _nameError.isNotEmpty ? _nameError : null,
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              width: double.infinity, // Full-width button
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
              ),
              child: ElevatedButton(
                onPressed: _addWork,
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple, // Button background color
                  onPrimary: mainTextcolor, // Text color
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text('Add Work'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
