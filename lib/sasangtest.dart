import 'package:flutter/material.dart';
import 'package:algoriju/style.dart';
import 'package:algoriju/testresult.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  List<int> _result = [0,0,0,0];
  List<String> _questions = ['땀이 특별히 나는 편은 아니다', '땀이 잠잘 때만 많이 난다', '땀이 많이 나는 편이다', '땀이 잘 나지 않는 편이다'];
  var _taeYang;
  var _taeEum;
  var _soYang;
  var _soEum;

  Future<void> _updateQ() async {
    await f1.collection('sasangTest').doc('question').collection('Taeyang').doc('answer').get().then(
            (value){
          _taeYang = value;
        }
    );
    await f2.collection('sasangTest').doc('question').collection('SoYang').doc('answer').get().then(
            (value){
          _soYang = value;
        }
    );
    await f3.collection('sasangTest').doc('question').collection('TaeEum').doc('TaeEum').get().then(
            (value){
          _taeEum = value;
        }
    );
    await f4.collection('sasangTest').doc('question').collection('SoEum').doc('answer').get().then(
            (value){
          _soEum = value;
        }
    );
    _questions = [_taeYang['$_questionNum'], _soYang['$_questionNum'], _taeEum['$_questionNum'], _soEum['$_questionNum']];
  }

  void _next(){
    _updateQ();
    if(_questionNum<14){
      _questionNum++;
    } else if(_questionNum==14){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const TestResult()));
    }
    _questions = [_taeYang['$_questionNum'], _soYang['$_questionNum'], _taeEum['$_questionNum'], _soEum['$_questionNum']];
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
                _next();
                _result[0]++;
              });
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
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
                _next();
                _result[1]++;
              });
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
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
                _next();
                _result[2]++;
              });
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
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
                _next();
                _result[3]++;
              });
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
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