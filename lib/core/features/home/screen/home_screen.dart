import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indistudent/core/features/auth/controller/auth_controller.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "indi",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF234DE2),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'Student',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    iconSize: 25,
                    icon: const Icon(LineIcons.facebookMessenger),
                    onPressed: () {
                      // ...
                    },
                  ),
                ],
              ),
            ),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                // ignore: prefer_const_constructors
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.pink,
                            // image: DecorationImage(
                            //   image: NetworkImage(user!.photoURL!),
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                        ),
                      ],
                    ),
                    Text('data'),
                  ],
                ),),
          ],
        ),
      ),
    );
  }
}
