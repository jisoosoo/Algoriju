import 'package:algoriju/reviewpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:algoriju/alcohol.dart';
import 'style.dart';

class SuggestAlcoholPage extends StatelessWidget {
  const SuggestAlcoholPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "추천으로 돌아가기",
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
      body: const AlcoholSuggestion(),
    );
  }
}

class AlcoholSuggestion extends StatefulWidget {
  const AlcoholSuggestion({Key? key}) : super(key: key);

  @override
  State<AlcoholSuggestion> createState() => _AlcoholSuggestionState();
}

class _AlcoholSuggestionState extends State<AlcoholSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const SizedBox(height: 50),
            const Text('알고리주의 추천 전통주', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 15,),
            Container(
              width: 300,
              padding: const EdgeInsets.fromLTRB(10,40,10,20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.mainColor,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(context.watch<Alcohol>().alcohol,
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.mainColor,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: IconButton(
                            icon: const Icon(Icons.message),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const ReviewPage()));
                            },
                          )
                          //Icon(Icons.message),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(Icons.shopping_basket),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text("이 전통주에 어울리는 안주", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              width: 300,
              padding: const EdgeInsets.fromLTRB(10,30,10,30),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.mainColor,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Text(context.watch<Alcohol>().food,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.mainColor,),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
