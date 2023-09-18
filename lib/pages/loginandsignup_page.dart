import 'package:flutter/material.dart';
import 'package:mrclean/pages/login_page.dart';
import 'package:mrclean/pages/signup_page.dart';

class LoginAndSignUpPage extends StatefulWidget {
  const LoginAndSignUpPage({super.key});

  @override
  State<LoginAndSignUpPage> createState() => _LoginAndSignUpPageState();
}

class _LoginAndSignUpPageState extends State<LoginAndSignUpPage> {
  bool isLogin = true;
  void toggelPage() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return LoginPage(
        onPressed: toggelPage,
      );
    } else {
      return SignupPage(
        onPressed: toggelPage,
      );
    }
  }
}
