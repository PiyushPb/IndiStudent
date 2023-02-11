import 'package:flutter/material.dart';
import 'package:indistudent/screen/login.dart';
import 'package:indistudent/screen/login_pages/login_with_email.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
          fontFamily: 'poppins', scaffoldBackgroundColor: Colors.white),
      home: LoginPage(),
    );
  }
}
