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
      title: 'Algoriju',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        backgroundColor: AppColor.mainColor,
        scaffoldBackgroundColor: AppColor.mainColor,
      ),
      home: const HomePage(),
    );
  }
}

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
        children: [],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 20,),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up, size: 20,),
            label: 'RECOMMEND',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt, size: 20,),
            label: 'TEST',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 20,),
            label: 'MY',
          ),
        ],
        currentIndex: _idx,
        onTap: (index){
          setState(() {
            _idx = index;
          });
        },
        selectedItemColor: AppColor.selectedColor,
        unselectedItemColor: Colors.black87,
        showUnselectedLabels: true,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
      )
    );
  }
}
