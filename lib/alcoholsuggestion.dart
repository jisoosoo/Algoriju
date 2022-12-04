import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'alcohol.dart';



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
              SizedBox(height: 100),
              Text('알고리주의 추천 전통주'),
              Container(
                width: 200,
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
                padding: EdgeInsets.fromLTRB(10,20,10,20),
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text("이 전통주에 어울리는 안주"),
              Container(
                alignment: Alignment.center,
                width: 200,
                child: Text('안주'),
                padding: EdgeInsets.fromLTRB(10,20,10,20),
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(
                    color: Colors.black,
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