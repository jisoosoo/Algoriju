import 'package:algoriju/reviewdetail.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'style.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "전통주 리뷰",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColor.mainColor,
        actions: [
          IconButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout)
          ),
        ],
      ),
      body: const ReviewList(),
    );
  }
}

class ReviewList extends StatelessWidget {
  const ReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Drink').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  final docs = snapshot.data!.docs;
                  return ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        final drinkName = docs[index]["name"];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(drinkName),
                            IconButton(
                                onPressed: (){
                                  //Navigator에 ReviewDetailPage에 drinkName을 파라미터로 넘겨주기
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewDetailPage(drinkName)));
                                },
                                icon: const Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        );
                      }
                  );
                },
              )
          ),
        ],
      ),
    );
  }
}
