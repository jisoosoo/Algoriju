import 'package:flutter/material.dart';
import 'package:algoriju/style.dart';

class TestResult extends StatelessWidget {
  TestResult({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
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
          const Text(
            '나의 사상체질은',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w600,
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