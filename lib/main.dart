import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:algoriju/style.dart';
import 'package:algoriju/home.dart';
import 'package:algoriju/sasangtest.dart';
import 'package:algoriju/tests.dart';
import 'alcohol.dart';
import 'package:algoriju/choosealcohol.dart';
import 'reviewpage.dart';
import 'loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => Tests(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Alcohol(),
        ),
      ],
      child: MaterialApp(
          title: 'Algoriju',
          theme: ThemeData(
            primarySwatch: Colors.grey,
            backgroundColor: AppColor.mainColor,
            scaffoldBackgroundColor: AppColor.mainColor,
          ),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return const Main();
              }
              else {
                return const LoginPage();
              }
            },
          )
      ),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() {
    return _MainState();
  }
}

class _MainState extends State<Main> {
  int _idx = 0;
  static List<Widget> pages = <Widget>[
    const HomePage(),
    const AlcoholPage(),
    const SaSangTest(),
    const ReviewPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_idx],
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
            icon: Icon(Icons.message, size: 20,),
            label: 'REVIEW',
          ),
        ],
        currentIndex: _idx,
        onTap: (index){
          setState(() {
            _idx = index;
          });
        },
        backgroundColor: AppColor.mainColor,
        selectedItemColor: AppColor.selectedColor,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
      )
    );
  }
}
