import 'package:algoriju/writereview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'style.dart';
import 'package:firebase_auth/firebase_auth.dart';

//drinkName 파라미터를 넘겨받고 해당 파라미터에 속한 review들을 추출하여 보여줌


class ReviewDetailPage extends StatelessWidget {
  String? drinkName = "";
  ReviewDetailPage(this.drinkName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "리뷰 상세",
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('review').orderBy('timeStamp').snapshots(),
                  builder: (context, snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    final docs = snapshot.data!.docs;
                    return ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (context,index){
                          if (docs[index]["DrinkName"]==drinkName){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 100,
                                width: 70,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.0),
                                    border: Border.all(
                                      color: AppColor.mainColor,
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: Column(
                                        children: [
                                          Text(docs[index]['userName'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(docs[index]['text'], style: const TextStyle(fontSize: 15),),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox(
                              height: 5,
                            );
                          }
                        }
                    );
                  },
                ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>WriteReviewPage(drinkName)));
        },
        backgroundColor: AppColor.mainColor,
        tooltip: '글쓰기',
        child: const Icon(
          Icons.border_color,
          color: Colors.white,
        ),
      ),
    );
  }
}

