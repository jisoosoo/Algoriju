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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/icon.png',
              height: 97,
              width: 97,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              width: 293,
              height: 124,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 28.0),
                    child: Text('나에게 맞는'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.0),
                    child: Text(
                      '전통주와 안주 추천',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SaSangTest(),));
            },
            child: Container(
              width: 293,
              height: 124,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 28.0),
                    child: Text('재미로 보는'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.0),
                    child: Text(
                      '사상체질 테스트',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: (){},
            child: Container(
              width: 293,
              height: 58,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 28.0),
                child: Text(
                  '리뷰 보기',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 20,),
            label: 'HOME',
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
