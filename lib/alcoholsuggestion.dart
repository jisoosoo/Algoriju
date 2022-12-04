import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'choosealcohol.dart';



class AlcoholsuggestionPage extends StatelessWidget {
  const AlcoholsuggestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '추천으로 돌아가기',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AlcoholsuggestionForm(title: '추천으로 돌아가기'),
    );
  }
}

class AlcoholsuggestionForm extends StatefulWidget {
  const AlcoholsuggestionForm({super.key, required this.title});
  final String title;
  @override
  State<AlcoholsuggestionForm> createState() => _AlcoholsuggestionFormState();
}

class _AlcoholsuggestionFormState extends State<AlcoholsuggestionForm> {
  var alcohol = ['sweet', 'dosu', 'type'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const SizedBox(height: 100),
              const Text('알고리주의 추천 전통주', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              const SizedBox(height: 15,),
              Container(
                width: 300,
                child: Column(
                  children: [
                    Text('alcohol'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.message),
                        Icon(Icons.shopping_basket),
                      ],
                    ),
                  ],
                ),
                padding: EdgeInsets.fromLTRB(10,40,10,20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 30),
              const Text("이 전통주에 어울리는 안주", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              Container(
                alignment: Alignment.center,
                width: 300,
                child: Text('안주'),
                padding: EdgeInsets.fromLTRB(10,30,10,20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}