import 'package:flutter/material.dart';
import 'package:algoriju/style.dart';
import 'package:provider/provider.dart';
import 'tests.dart';
import 'dart:math';

class TestResult extends StatefulWidget {
  const TestResult({Key? key}) : super(key: key);

  @override
  State<TestResult> createState() => _TestResultState();
}

class _TestResultState extends State<TestResult> {
  int _idx = 2;

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
                style: TextStyle(
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
                        fontSize: 20,
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
                        fontSize: 20,
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 20,),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up, size: 20,),
            label: 'RECOMMEND',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt, size: 20,),
            label: 'TEST',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 20,),
            label: 'MY',
          ),
        ],
        currentIndex: _idx,
        onTap: (index){
          setState(() {
            _idx = index;
          });
        },
        backgroundColor: AppColor.mainColor,
        selectedItemColor: AppColor.selectedColor,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}