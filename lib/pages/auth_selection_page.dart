import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mrclean/pages/home_page.dart';
import 'package:mrclean/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:  (context, AsyncSnapshot<User?> snapshot ){
          if(snapshot.connectionState==ConnectionState.waiting){
           return const CircularProgressIndicator();
          }
          else{
            if(snapshot.hasData){
              return const HomePage();
            }
            else{
              return const LoginPage();
            }
          }
        },
      ),
    );
  }
}
