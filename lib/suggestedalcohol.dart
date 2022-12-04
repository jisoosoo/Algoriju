import 'package:algoriju/reviewpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'alcohol.dart';

class SuggestAlcoholPage extends StatelessWidget {
  SuggestAlcoholPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("추천으로 돌아가기"),
      ),
      body: AlcoholSuggestion(),
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
              padding: EdgeInsets.fromLTRB(10,40,10,20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(context.watch<Alcohol>().alcohol, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red,),),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: IconButton(
                            icon: Icon(Icons.message),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewPage()));
                            },
                          )
                          //Icon(Icons.message),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
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
              child: Text(context.watch<Alcohol>().food, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),),
              padding: EdgeInsets.fromLTRB(10,30,10,30),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
