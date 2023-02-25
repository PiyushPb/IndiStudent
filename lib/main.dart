import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indistudent/firebase_options.dart';
import 'package:indistudent/screen/login.dart';
import 'package:indistudent/screen/login_pages/email_sent.dart';
import 'package:indistudent/screen/login_pages/login_with_email.dart';
import 'package:indistudent/screen/user_create_form/user_form.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
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
