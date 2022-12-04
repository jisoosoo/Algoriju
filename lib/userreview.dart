import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserReviewPage extends StatelessWidget {
  const UserReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("전통주 리뷰"),
        actions: [
          IconButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout)
          ),
        ],
      ),
      body: const UserReviewList(),
    );
  }
}

class UserReviewList extends StatelessWidget {
  const UserReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
