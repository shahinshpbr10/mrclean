// ignore_for_file: use_build_context_synchronously

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrclean/pages/work_adding_page.dart';
import 'package:mrclean/utils/color.dart';
import 'package:mrclean/widgets/service_card.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundcolor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Hello User !',
                    textStyle: GoogleFonts.montserrat(
                      fontSize: 26,
                      color: mainTextcolor,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 50),
                  ),
                ],
                totalRepeatCount: 1,
                pause: const Duration(seconds: 1),
                displayFullTextOnTap: true,
              ),
              Text(
                "What Are u Looking For ?",
                style: GoogleFonts.montserrat(color: mainTextcolor),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkAddingScreen()),
                  );
                },
                child: ServiceCard(
                  imagePath: "assets/homeCleaning.png",
                  labelText: 'House Cleaning',
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkAddingScreen()),
                  );
                },
                child: ServiceCard(
                    imagePath: 'assets/officecleaning.jpg',
                    labelText: "Office Cleaning"),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkAddingScreen()),
                  );
                },
                child: ServiceCard(
                    imagePath: 'assets/carcleaning.png',
                    labelText: "Car Cleaning"),
              ),
              SizedBox(
                height: 40,
              ),
              Text('Contact Us',
                  style: GoogleFonts.montserrat(
                      color: mainTextcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 26)),
              SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        // Replace 'phone_number' with the actual phone number you want to open the chat with
                        final phoneNumber = '8606466364';

                        // Encode the phone number to remove any non-alphanumeric characters
                        final encodedPhoneNumber =
                            Uri.encodeComponent(phoneNumber);

                        // Create the WhatsApp URL with the phone number
                        final whatsappUrl = 'https://wa.me/$encodedPhoneNumber';

                        // Check if the WhatsApp app is installed, and if so, open the chat
                        if (await canLaunch(whatsappUrl)) {
                          await launch(whatsappUrl);
                        } else {
                          // If WhatsApp is not installed, provide an error message
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('WhatsApp Not Found'),
                                content: Text(
                                    'WhatsApp is not installed on your device.'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Image.asset(
                        'assets/whatsapp.png',
                        width: 110,
                        height: 110,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                        onTap: () async {
                          // Replace 'username' with the actual Instagram username or ID
                          const instagramUsername = 'mr.clean.service_';

                          // The URL of the Instagram profile
                          const instagramUrl =
                              'https://www.instagram.com/$instagramUsername/';

                          // Check if the Instagram app is installed, and if so, open the app
                          if (await canLaunch(
                              'instagram://user?username=$instagramUsername')) {
                            await launch(
                                'instagram://user?username=$instagramUsername');
                          } else {
                            // If the Instagram app is not installed, open the profile in a web browser
                            await launch(instagramUrl);
                          }
                        },
                        child: Image.asset(
                          'assets/instgram.png',
                          width: 100,
                          height: 100,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                        onTap: () async {
                          // Replace 'email_address' with the actual email address you want to send the email to
                          const emailAddress = 'mrcleanserviceserv@gmail.com';

                          // Replace 'subject' with the desired email subject
                          const subject = 'Message from your Mr clean app!';

                          // Replace 'body' with the desired email body
                          const body = 'I\'m interested in your services.';

                          // Create the email URL
                          final emailUrl = Uri(
                            scheme: 'mailto',
                            path: emailAddress,
                            queryParameters: {
                              'subject': subject,
                              'body': body,
                            },
                          ).toString();

                          // Check if the email client is available, and if so, open it with the pre-filled email
                          if (await canLaunch(emailUrl)) {
                            await launch(emailUrl);
                          } else {
                            // If the email client is not available, provide an error message
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Email Client Not Found'),
                                  content: const Text(
                                      'No email client is available on your device.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Image.asset(
                          'assets/email.png',
                          width: 80,
                          height: 80,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                        onTap: () async {
                          // Replace 'phone_number' with the actual phone number you want to call
                          final phoneNumber = '6238348992';

                          // Create the phone call URL
                          final phoneUrl = 'tel:$phoneNumber';

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
                                  title: const Text('Phone Call Not Supported'),
                                  content: const Text(
                                      'Phone call functionality is not available on your device.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Image.asset(
                          'assets/call.png',
                          width: 80,
                          height: 80,
                        )),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}
