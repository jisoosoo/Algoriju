import 'package:flutter/material.dart';
import 'package:algoriju/style.dart';
import 'package:algoriju/testresult.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'tests.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SaSangTest extends StatefulWidget {
  const SaSangTest({Key? key}) : super(key: key);

  @override
  State<SaSangTest> createState() => _SaSangTestState();
}

class _SaSangTestState extends State<SaSangTest> {
  FirebaseFirestore f1 = FirebaseFirestore.instance;
  FirebaseFirestore f2 = FirebaseFirestore.instance;
  FirebaseFirestore f3 = FirebaseFirestore.instance;
  FirebaseFirestore f4 = FirebaseFirestore.instance;
  int _questionNum = 1;
  List<String> _questions = ['땀이 특별히 나는 편은 아니다', '땀이 잠잘 때만 많이 난다', '땀이 많이 나는 편이다', '땀이 잘 나지 않는 편이다'];
  var _taeYang;
  var _taeEum;
  var _soYang;
  var _soEum;

  @override
  void initState() {
    super.initState();
    _questionNum = 1;
    _updateQ();
  }

  void _updateQ() {
    f1.collection('sasangTest').doc('question').collection('Taeyang').doc('answer').get().then(
        (value){_taeYang = value; _questions[0] = _taeYang['${_questionNum+1}'];}
    );
    f2.collection('sasangTest').doc('question').collection('SoYang').doc('answer').get().then(
        (value){_soYang = value; _questions[1] = _soYang['${_questionNum+1}'];}
    );
    f3.collection('sasangTest').doc('question').collection('TaeEum').doc('TaeEum').get().then(
        (value){_taeEum = value; _questions[2] = _taeEum['${_questionNum+1}'];}
    );
    f4.collection('sasangTest').doc('question').collection('SoEum').doc('answer').get().then(
        (value){_soEum = value; _questions[3] = _soEum['${_questionNum+1}'];}
    );
  }

  void _next(int i){
    switch(i){
      case 1:
        context.read<Tests>().inc1();
        break;
      case 2:
        context.read<Tests>().inc2();
        break;
      case 3:
        context.read<Tests>().inc3();
        break;
      case 4:
        context.read<Tests>().inc4();
        break;
    }
    if(_questionNum<14){
      _questionNum++;
      _updateQ();
    } else if(_questionNum==14){
      context.read<Tests>().setResult();
      Navigator.push(context, MaterialPageRoute(builder: (context) => const TestResult()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '사상체질 테스트',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 55,
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.mainColor,
                ),
                alignment: Alignment.center,
                child: Text(
                  '$_questionNum',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Text(
            '나는 보통...',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: (){
              setState((){
                _next(1);
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.mainColor,
              side: const BorderSide(
                width: 2,
                color: AppColor.mainColor,
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(8.0),
            ),
            child: SizedBox(
              height: 30,
              width: 300,
              child: Text(_questions[0],
                style: const TextStyle(fontSize: 20, height: 1.3,),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: (){
              setState((){
                _next(2);
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(
                width: 2,
                color: AppColor.mainColor,
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(8.0),
            ),
            child: SizedBox(
              height: 30,
              width: 300,
              child: Text(_questions[1],
                style: const TextStyle(fontSize: 20, height: 1.3,),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: (){
              setState((){
                _next(3);
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.mainColor,
              side: const BorderSide(
                width: 2,
                color: AppColor.mainColor,
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(8.0),
            ),
            child: SizedBox(
              height: 30,
              width: 300,
              child: Text(_questions[2],
                style: const TextStyle(fontSize: 20, height: 1.3,),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: (){
              setState((){
                _next(4);
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.mainColor,
              side: const BorderSide(
                width: 2,
                color: AppColor.mainColor,
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(8.0),
            ),
            child: SizedBox(
              height: 30,
              width: 300,
              child: Text(_questions[3],
                style: const TextStyle(fontSize: 20, height: 1.3,),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}