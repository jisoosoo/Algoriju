import 'package:algoriju/style.dart';
import 'package:flutter/material.dart';

class SuccessRegisterPage extends StatelessWidget {
  const SuccessRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: const Text("Success Register", style: TextStyle(color: Colors.white),),
        backgroundColor: AppColor.mainColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have successfully registered', style: TextStyle(fontSize: 20),),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 20),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.mainColor,
                ),
            ),
          ],
        ),
      ),
    );
  }
}