import 'package:flutter/material.dart';
import 'package:algoriju/style.dart';
import 'package:provider/provider.dart';
import 'tests.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TestResult extends StatefulWidget {
  const TestResult({Key? key}) : super(key: key);

  @override
  State<TestResult> createState() => _TestResultState();
}

class _TestResultState extends State<TestResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '사상체질 테스트 결과',
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Column(
            children: [
              const Text(
                '나의 사상체질은',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                context.read<Tests>().results,
                style: const TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 45,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 18.0,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text(
                    '어울리는 전통주',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    height: 109,
                    width: 143,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColor.mainColor
                      ),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      context.read<Tests>().drinks,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: AppColor.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    '어울리는 안주',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    height: 109,
                    width: 143,
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: AppColor.mainColor
                      ),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      context.read<Tests>().food,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: AppColor.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}