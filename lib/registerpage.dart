import 'package:algoriju/SuccessRegister.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'style.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "회원가입",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColor.mainColor,
      ),
      body: const RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _authentication = FirebaseAuth.instance;
  String email = '';
  String password = '';
  String userName = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "이메일",
              ),
              onChanged: (value) {
                email = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "비밀번호",
              ),
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "이름",
              ),
              onChanged: (value) {
                userName = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.mainColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(12.0),
              ),
              onPressed: () async {
                try{
                  final newUser = await _authentication.createUserWithEmailAndPassword(email: email, password: password);
                  await FirebaseFirestore.instance.collection('user').doc(newUser.user!.uid).set({
                    'userName': userName,
                    'email': email,
                  });

                  if (newUser.user != null) {
                    _formKey.currentState!.reset();
                    if (!mounted) return;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SuccessRegisterPage()));
                  }
                } catch (e) {
                  print(e);
                }
              },

              child: const Text(
                "입력",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("이미 회원가입을 했다면, "),
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text("로그인하기"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
