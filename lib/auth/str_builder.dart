import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reci/auth/log_out.dart';
import 'package:reci/auth/login_page.dart';
import 'package:reci/screenBnb/explore_screen.dart';
import 'package:reci/screenBnb/fff.dart';

class AuthServices extends StatefulWidget {
  const AuthServices({super.key});

  @override
  State<AuthServices> createState() => _AuthServicesState();
}

class _AuthServicesState extends State<AuthServices> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data;
            if (user == null) {
              return LoginPage();
            } else {
              return LogOutPage();
            }
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
