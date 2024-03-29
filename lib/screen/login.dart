import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:indistudent/screen/login_pages/login_with_email.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // mobile code
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: Image.asset('assets/images/logo.png'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                child: Image.asset('assets/images/communityimg.png'),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Join India's most active student community with 1.5 million+ students",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                  'Make smart friends, learn new skills, and grow your network like you have never done before. It\'s a place to have fun and explore more students with similar interests.',
                  style: TextStyle(
                    color: Color.fromARGB(255, 83, 83, 83),
                  )),
              Expanded(child: Container()),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginWithEmailPage(),
                      ),
                    );
                  },
                  child: const Text('Sign in using Email'),
                ),
              ),
              const SizedBox(height: 10.0),
              // ignore: prefer_const_constructors
              Align(
                alignment: Alignment.center,
                child: const Text(
                  'OR',
                  style: TextStyle(
                    color: Color.fromARGB(255, 83, 83, 83),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  // ignore: prefer_const_constructors
                  icon: Image.asset(
                    'assets/images/google.png',
                    height: 24,
                  ),
                  label: Text('Sign in using Google'), // <-- Text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
