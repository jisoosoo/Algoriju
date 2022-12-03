import 'package:flutter/material.dart';
import 'package:algoriju/style.dart';
import 'package:algoriju/sasangtest.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _idx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/icon.png',
                height: 97,
                width: 97,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){},
              child: Container(
                width: 293,
                height: 124,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 28.0),
                      child: Text('나에게 맞는'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24.0),
                      child: Text(
                        '전통주와 안주 추천',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SaSangTest(),));
              },
              child: Container(
                width: 293,
                height: 124,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 28.0),
                      child: Text('재미로 보는'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24.0),
                      child: Text(
                        '사상체질 테스트',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){},
              child: Container(
                width: 293,
                height: 58,
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 28.0),
                  child: Text(
                    '리뷰 보기',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
