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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/icon.png',
                height: 135,
                width: 135,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              '사상체질 기반 전통주 추천 서비스',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const Text(
              '알고리주',
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.w900,
                color: AppColor.selectedColor,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            const Text(
              '하단 버튼을 눌러 원하시는 서비스를 선택해주세요.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
    );
  }
}
