import 'package:edamkar_1/pages/HomePage.dart';
import 'package:edamkar_1/pages/RemakePass.dart';
import 'package:edamkar_1/pages/emergencyCall.dart';
import 'package:edamkar_1/pages/otpverification.dart';
import 'package:edamkar_1/pages/resetpass.dart';
import 'package:edamkar_1/pages/signin.dart';
import 'package:edamkar_1/pages/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'E-Damkar',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => EmergencyCall(),
      '/signin': (context) => SignInPage(),
      '/signup': (context) => SignUpPage(),
      '/remakepass': (context) => RemakePassPage(),
      '/resetpass': (context) => ResetPassPage(),
      '/otp': (context) => OtpVerificationPage(),
      '/homepage':(context) => HomePage()
    },
  ));
}
