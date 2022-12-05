import 'package:flutter/material.dart';
import 'style.dart';

class SuccessRegisterPage extends StatelessWidget {
  const SuccessRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
          "회원가입 완료",
        ),
        backgroundColor: AppColor.mainColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('회원가입이 완료되었습니다', style: TextStyle(fontSize: 20),),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text("로그인하기"),
            ),
          ],
        ),
      ),
    );
  }
}