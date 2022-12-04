import 'package:algoriju/SuccessLogin.dart';
import 'package:algoriju/SuccessRegister.dart';
import 'package:algoriju/choosealcohol.dart';
import 'package:algoriju/loginpage.dart';
import 'package:algoriju/registerpage.dart';
import 'package:algoriju/reviewpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'alcohol.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Alcohol(),
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.pink,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData){
              //return const ReviewPage();
              return const AlcoholPage();
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}



