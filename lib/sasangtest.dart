import 'package:flutter/material.dart';
import 'package:algoriju/style.dart';
import 'package:algoriju/testresult.dart';

class SaSangTest extends StatefulWidget {
  const SaSangTest({super.key, required this.title});

  final String title;

  @override
  State<SaSangTest> createState() => _SaSangTestState();
}

class _SaSangTestState extends State<SaSangTest> {
  int questionNum = 1;
  List<List<String>> questions = List.generate(16, (i) => ['']).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
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
                  '$questionNum',
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
            onPressed: (){},
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
              child: const Text('A',
                style: TextStyle(fontSize: 20, height: 1.3,),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: (){},
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
              child: const Text('B',
                style: TextStyle(fontSize: 20, height: 1.3,),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: (){},
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
              child: const Text('C',
                style: TextStyle(fontSize: 20, height: 1.3,),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: (){},
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
              child: const Text('D',
                style: TextStyle(fontSize: 20, height: 1.3,),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 35,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  primary: AppColor.mainColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  padding: const EdgeInsets.all(8.0),
                ),
                child: Text(
                  '이전',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  primary: AppColor.mainColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  padding: const EdgeInsets.all(8.0),
                ),
                child: Text(
                  '다음',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  primary: Colors.transparent,
                  onPrimary: Colors.black,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.home,
                      size: 35,
                    ),
                    Text('Home'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  primary: Colors.transparent,
                  onPrimary: Colors.black,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.person,
                      size: 35,
                    ),
                    Text('My Page'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}