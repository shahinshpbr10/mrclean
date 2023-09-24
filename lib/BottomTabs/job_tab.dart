import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrclean/job_data.dart';
import 'package:mrclean/utils/color.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
// Import your JobData class

class JobTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        elevation: 0,
        title: Center(
          child: Text(
            ' Pending Works ',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              color: mainTextcolor,
              fontSize: 26,
            ),
          ),
        ),
      ),
      body: Consumer<JobData>(
        builder: (context, jobData, child) {
          // Use jobData.workList to display job descriptions
          return ListView.builder(
            itemCount: jobData.workList.length,
            itemBuilder: (context, index) {
              final work = jobData.workList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  tileColor: mainTextcolor,
                  title: Text(
                    'Descrption:-  ${work['description']!}',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, color: backgroundcolor),
                  ),
                  subtitle: Column(
                    children: [
                      Text(
                          'Date: ${work['date']}, Location: ${work['location']},name:${work['Name']}'),
                      Row(
                        children: [
                          Text('PhoneNumber:${work['phoneNumber']}'),
                          IconButton(
                              onPressed: () async {
                                // Replace 'phone_number' with the actual phone number you want to call

                                // Create the phone call URL
                                final phoneUrl = 'tel:${work['phoneNumber']}';

                                // Check if the phone call functionality is available, and if so, initiate the call
                                if (await canLaunch(phoneUrl)) {
                                  await launch(phoneUrl);
                                } else {
                                  // If phone call functionality is not available, provide an error message
                                  // ignore: use_build_context_synchronously
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text(
                                            'Phone Call Not Supported'),
                                        content: const Text(
                                            'Phone call functionality is not available on your device.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              icon: Icon(Icons.call))
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
