import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indistudent/core/features/auth/controller/auth_controller.dart';
import 'package:indistudent/core/features/home/screen/widgets/circle_button.dart';
import 'package:indistudent/core/features/home/screen/widgets/communities.dart';
import 'package:indistudent/core/features/post/newpost.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl/intl.dart';

class PostCard extends StatelessWidget {
  final Map<String, dynamic> postData;

  PostCard(this.postData);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(postData['creatorPhotoUrl']),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      postData['creatorName'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat.yMMMMd()
                          .add_jm()
                          .format(postData['createdAt'].toDate()),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Image.network(postData['imageUrl']),
            SizedBox(height: 10),
            Text(postData['caption']),
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () {
                    // TODO: Handle like button press
                  },
                ),
                Text('${postData['likesCount']} likes'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final postCollection = FirebaseFirestore.instance.collection('posts');

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
            child: StreamBuilder<QuerySnapshot>(
              stream: postCollection.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final postDocs = snapshot.data!.docs;

                  return Column(
                    children: postDocs.map((doc) {
                      final postData = doc.data() as Map<String, dynamic>;
                      return PostCard(postData);
                    }).toList(),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreatePostScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
