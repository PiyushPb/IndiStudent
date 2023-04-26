import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indistudent/core/features/auth/controller/auth_controller.dart';
import 'package:indistudent/core/features/home/screen/widgets/circle_button.dart';
import 'package:indistudent/core/features/home/screen/widgets/communities.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // pinned: true,
            backgroundColor: Colors.white,
            title: SizedBox(
              width: 100,
              child: Image.asset('assets/images/logo.png'),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleNavButton(
                icon: Icons.search,
                iconSize: 25.0,
                onPressed: () => print('Search'),
              ),
              CircleNavButton(
                icon: LineIcons.facebookMessenger,
                iconSize: 25.0,
                onPressed: () => print('Search'),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Text('Hello test'),
          )
        ],
      ),
    );
  }
}
