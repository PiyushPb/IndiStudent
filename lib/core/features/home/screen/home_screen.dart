import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indistudent/core/features/auth/controller/auth_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
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
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    iconSize: 20,
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // ...
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
