import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mrclean/pages/login_page.dart';
import 'package:mrclean/utils/color.dart';

class SignupPage extends StatefulWidget {
  final void Function()? onPressed;
  SignupPage({super.key, this.onPressed});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  bool _obscureText = true;

  createUserWithEmailAndPassword() async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'weak-password') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.deepPurple,
            content: Text('The password provided is too weak.'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.deepPurple,
            content: Text('The account already exist on this email'),
          ),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundcolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset("assets/signuppagelottie.json",
                  width: 200, height: 200),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _email,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Email is empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            hintText: 'Email',
                            prefixIcon: Icon(
                              Icons.email_rounded,
                              color: Colors.deepPurple,
                            ),
                            hintStyle: GoogleFonts.montserrat(
                                color: Colors.deepPurple),
                            hoverColor: mainTextcolor,
                            fillColor: mainTextcolor,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                width: 3,
                                color: Colors
                                    .deepPurple, // Border color when focused
                              ),
                            ),
                            filled: true),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: _obscureText,
                        controller: _password,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Password is empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple,
                                  width: 3 // Border color when focused
                                  ),
                            ),
                            hintText: 'Password',
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            prefixIcon: const Icon(
                              Icons.password_rounded,
                              color: Colors.deepPurple,
                            ),
                            hintStyle: GoogleFonts.montserrat(
                                color: Colors.deepPurple),
                            hoverColor: mainTextcolor,
                            fillColor: mainTextcolor,
                            filled: true),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(boxShadow: [
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
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    createUserWithEmailAndPassword();
                                  });
                                }
                              },
                              child: const Text('Register'),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have a account",
                            style: GoogleFonts.montserrat(color: mainTextcolor),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                            },
                            child: Text(
                              'Login!',
                              style: GoogleFonts.montserrat(
                                  color: Colors.deepPurple),
                            ),
                          ),
                        ],
                      ),
                      if (isLoading)
                        CircularProgressIndicator(
                          color:
                              Colors.deepPurple, // Change to your desired color
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
