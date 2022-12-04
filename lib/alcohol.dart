import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'alcoholsuggestion.dart';

class AlcoholPage extends StatelessWidget {
  const AlcoholPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '전통주와 안주 추천',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const AlcoholForm(title: '전통주와 안주 추천'),
    );
  }
}

class AlcoholForm extends StatefulWidget {

  const AlcoholForm({super.key, required this.title});

  final String title;

  @override
  State<AlcoholForm> createState() => _AlcoholFormState();
}

class _AlcoholFormState extends State<AlcoholForm> {
  var sweet ='낮음';
  var dosu = '낮음';
  var type = '막걸리탁주';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('전통주와 안주 추천'),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    child: Text('당도'),
                    onPressed: () {},
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                          child: const Text('낮음'),
                          onPressed: () {
                            setState(() {
                              if (sweet == '높음') {
                                sweet = '낮음';
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(60, 60),
                            shape: const CircleBorder(),
                          ),
                      ),
                      OutlinedButton(
                        child: const Text('높음'),
                        onPressed: () {
                          setState(() {
                            if (sweet == '낮음') {
                              sweet = '높음';
                              }
                            });
                          },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(60, 60),
                          shape: const CircleBorder(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Divider(color: Colors.black, thickness: 2.0),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    child: Text('도수'),
                    onPressed: () {},
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        child: const Text('낮음'),
                        onPressed: () {
                          setState(() {
                            if (dosu == '높음') {
                              dosu = '낮음';
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(60, 60),
                          shape: const CircleBorder(),
                        ),
                      ),
                      OutlinedButton(
                        child: const Text('높음'),
                        onPressed: () {
                          setState(() {
                            if (dosu == '낮음') {
                              dosu = '높음';
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(60, 60),
                          shape: const CircleBorder(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Divider(color: Colors.black, thickness: 2.0),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: ElevatedButton(
                    child: Text('주종'),
                    onPressed: () {},
                  ),
                ),
                Container(
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        child: const Text('막걸리탁주'),
                        onPressed: () {
                          setState(() {
                            if (type != '막걸리탁주') {
                              type = '막걸리탁주';
                              print(type);
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(60, 60),
                          shape: const CircleBorder(),
                        ),
                      ),
                      OutlinedButton(
                        child: const Text('약주청주'),
                        onPressed: () {
                          setState(() {
                            if (type != '약주청주') {
                              type = '약주청주';
                              print(type);
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(60, 60),
                          shape: const CircleBorder(),
                        ),
                      ),
                      OutlinedButton(
                        child: const Text('증류주리큐르'),
                        onPressed: () {
                          setState(() {
                            if (type != '증류주리큐르') {
                              type = '증류주리큐르';
                              print(type);
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(60, 60),
                          shape: const CircleBorder(),
                        ),
                      ),
                      OutlinedButton(
                        child: const Text('와인과일주'),
                        onPressed: () {
                          setState(() {
                            if (type != '와인과일주') {
                              type = '와인과일주';
                              print(type);
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(60, 60),
                          shape: const CircleBorder(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print(sweet+dosu+type);
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=>AlcoholsuggestionPage()));
            },
            child: Text('알고리주!'),
          )
        ],
      ),
    );
  }
}
