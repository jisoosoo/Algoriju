import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class WriteReviewPage extends StatelessWidget {
  String? drinkName = "";
  WriteReviewPage(this.drinkName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("리뷰 작성"),
      ),
      body: ReviewForm(drink: drinkName,),
    );
  }
}

class ReviewForm extends StatefulWidget {
  const ReviewForm({Key? key, required this.drink}) : super(key: key);
  final String? drink;
  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  final _reviewController = TextEditingController();
  final _authentication = FirebaseAuth.instance;
  String newReview = '';


  @override
  void dispose(){
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    String? drinkName = widget.drink;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(drinkName!),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: 400,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _reviewController,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp('[\\@]')),
                  FilteringTextInputFormatter.deny(RegExp('[\\#]')),
                ],
                minLines: 1,
                maxLines: 20,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "리뷰를 작성해주세요",
                  hintStyle: TextStyle(
                    color: Colors.grey
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    newReview = value;
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: newReview.trim().isEmpty ? null : () async {
                final currentUser = FirebaseAuth.instance.currentUser;
                final currentUserName = await FirebaseFirestore.instance.collection('user').doc(currentUser!.uid).get();
                //final currentDrinkName = await FirebaseFirestore.instance.collection('Drink').doc('00').get();
                //print(currentDrinkName.data()!['type1']);
                FirebaseFirestore.instance.collection('review').add({
                  'text': newReview,
                  'userName' : currentUserName.data()!['userName'],
                  'timeStamp' : Timestamp.now(),
                  'uid' : currentUser.uid,
                  'DrinkName' : drinkName,
                  // currentDrinkName.data()!['name'],
                });
                Navigator.pop(context);
                },
              child: const Text("작성 완료", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}
