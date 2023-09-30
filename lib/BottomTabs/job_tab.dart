import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrclean/data/job_data.dart';
import 'package:mrclean/utils/color.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class JobTab extends StatefulWidget {
  @override
  State<JobTab> createState() => _JobTabState();
}

class _JobTabState extends State<JobTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        leading: null,
        backgroundColor: backgroundcolor,
        elevation: 0,
        title: Center(
          child: Text(
            'Pending Works',
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
          return ListView.builder(
            itemCount: jobData.workList.length,
            itemBuilder: (context, index) {
              final work = jobData.workList[index];
              return Dismissible(
                key: Key(work['description']!), // Use 'description' as the key
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                onDismissed: (direction) {
                  // Remove the item from the list when dismissed
                  jobData.removeDescription(work['description']!);
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: ListTile(
                      tileColor: Colors.deepPurple,
                      contentPadding: EdgeInsets.all(16),
                      title: Text('Description: ${work['description']!}',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                              color: backgroundcolor,
                              fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        children: [
                          Text('Location: ${work['location']}',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  color: backgroundcolor)),
                          Text(' Name of Client: ${work['Name']}',
                              style: GoogleFonts.montserrat(
                                  color: backgroundcolor)),
                          Text(
                            'Date: ${work['date']}',
                            style:
                                GoogleFonts.montserrat(color: backgroundcolor),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Phone Number: ${work['phoneNumber']}',
                                style: GoogleFonts.montserrat(
                                    color: backgroundcolor),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final phoneUrl =
                                      'tel:${work['phoneNumber']}';

                                  if (await canLaunch(phoneUrl)) {
                                    await launch(phoneUrl);
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title:
                                              Text('Phone Call Not Supported'),
                                          content: Text(
                                            'Phone call functionality is not available on your device.',
                                            style: TextStyle(
                                              color: backgroundcolor,
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                icon: Icon(Icons.call),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
