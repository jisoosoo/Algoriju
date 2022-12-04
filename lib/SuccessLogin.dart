import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SuccessLoginPage extends StatefulWidget {
  const SuccessLoginPage({Key? key}) : super(key: key);

  @override
  State<SuccessLoginPage> createState() => _SuccessLoginPageState();
}

class _SuccessLoginPageState extends State<SuccessLoginPage> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser(){
    try{
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
      }
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Success Login"),
        actions: [
          IconButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout)
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have successfully Login', style: TextStyle(fontSize: 20),),
            const SizedBox(
              height: 20,
            ),
            Text(loggedUser!.email!, style: TextStyle(
              fontSize: 20,
            ),),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}