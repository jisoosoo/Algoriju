import 'package:flutter/material.dart';
import 'package:algoriju/style.dart';
import 'package:algoriju/sasangtest.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algori-ju',
      theme: ThemeData(
        primarySwatch: Colors.grey
      ),
      home: const SaSangTest(title: '사상체질 테스트'),
    );
  }
}
