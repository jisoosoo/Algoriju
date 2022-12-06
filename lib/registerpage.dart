import 'package:algoriju/SuccessRegister.dart';
import 'package:algoriju/style.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: const Text("Register", style: TextStyle(color: Colors.white),),
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
              decoration: InputDecoration(
                labelText: "Email",
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
              decoration: InputDecoration(
                labelText: "Password",
              ),
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "User Name",
              ),
              onChanged: (value) {
                userName = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
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
              child: const Text("Enter", style: TextStyle(fontSize: 20, color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.mainColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Already registered, "),
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text("Login", style: TextStyle(color: Colors.blue),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
