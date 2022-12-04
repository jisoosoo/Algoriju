import 'package:flutter/material.dart';
import 'package:algoriju/style.dart';
import 'package:algoriju/testresult.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SaSangTest extends StatefulWidget {
  const SaSangTest({Key? key}) : super(key: key);

  @override
  State<SaSangTest> createState() => _SaSangTestState();
}

class _SaSangTestState extends State<SaSangTest> {
  int _questionNum = 1;
  List<int> _result = [0,0,0,0];
  String _taeYang = '';
  String _taeEum = '';
  String _soYang = '';
  String _soEum = '';

  void _next(){
    if(_questionNum<15){
      _questionNum++;
    } else if(_questionNum==15){

      Navigator.push(context, MaterialPageRoute(builder: (context) => const TestResult()));
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore f = FirebaseFirestore.instance;
    late final _docs;

    Future<void> _getQ() async {
      await f.collection('sasangTest').doc('question').get().then(
          (value) => _docs = value
      );
      _taeYang = _docs[0].data().collection('1')['1'].toString();
    }

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
                _getQ();
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
              child: Text(_taeYang,
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
                _getQ();
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
              child: Text(_soYang,
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
                _getQ();
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
              child: Text(_taeEum,
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
                _getQ();
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
              child: Text(_soEum,
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