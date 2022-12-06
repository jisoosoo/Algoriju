import 'package:algoriju/style.dart';
import 'package:algoriju/suggestedalcohol.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'alcohol.dart';
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
        backgroundColor: AppColor.mainColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(35.0, 0.0, 0.0, 10.0),
                    child: ElevatedButton(
                      child: Text('당도'),
                      // style: ButtonStyle(
                      //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      //     RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(20.0),
                      //     ),
                      //   ),
                      // ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: AppColor.mainColor,
                      ),
                      onPressed: () {},
                    ),
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
                              sweet = '낮음';
                          });
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              const CircleBorder(),
                            ),
                            fixedSize: MaterialStateProperty.all(
                              const Size(75, 75),
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith((states){
                              if (sweet == "높음"){
                                return Colors.white;
                              } else {
                                return AppColor.mainColor;
                              }
                            }),
                            foregroundColor: MaterialStateProperty.resolveWith((states){
                              if (sweet == "높음"){
                                return AppColor.mainColor;
                              }
                              else {
                                return Colors.white;
                              }
                            })
                        ),
                      ),
                      OutlinedButton(
                        child: const Text('높음'),
                        onPressed: () {
                          setState(() {
                              sweet = '높음';
                          });
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              const CircleBorder(),
                            ),
                            fixedSize: MaterialStateProperty.all(
                              const Size(75, 75),
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith((states){
                              if (sweet == "낮음"){
                                return Colors.white;
                              } else {
                                return AppColor.mainColor;
                              }
                            }),
                            foregroundColor: MaterialStateProperty.resolveWith((states){
                              if (sweet == "낮음"){
                                return AppColor.mainColor;
                              }
                              else {
                                return Colors.white;
                              }
                            })
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(35.0, 0.0, 0.0, 10.0),
                    child: ElevatedButton(
                      child: Text('도수'),
                      onPressed: () {},
                      // style: ButtonStyle(
                      //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      //         RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(20.0),
                      //         )
                      //     )
                      // ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: AppColor.mainColor,
                      ),
                    ),
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
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              const CircleBorder(),
                            ),
                            fixedSize: MaterialStateProperty.all(
                              const Size(75, 75),
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith((states){
                              if (dosu == "높음"){
                                return Colors.white;
                              } else {
                                return AppColor.mainColor;
                              }
                            }),
                            foregroundColor: MaterialStateProperty.resolveWith((states){
                              if (dosu == "높음"){
                                return AppColor.mainColor;
                              }
                              else {
                                return Colors.white;
                              }
                            })
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
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            const CircleBorder(),
                          ),
                          fixedSize: MaterialStateProperty.all(
                            const Size(75, 75),
                          ),
                          backgroundColor: MaterialStateProperty.resolveWith((states){
                            if (dosu == "낮음"){
                              return Colors.white;
                            } else {
                              return AppColor.mainColor;
                            }
                          }),
                          foregroundColor: MaterialStateProperty.resolveWith((states){
                            if (dosu == "낮음"){
                              return AppColor.mainColor;
                            }
                            else {
                              return Colors.white;
                            }
                          })
                        ),
                        // style: ElevatedButton.styleFrom(
                        //   fixedSize: const Size(60, 60),
                        //   shape: const CircleBorder(),
                        // ),

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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(35.0, 0.0, 0.0, 10.0),
                    child: ElevatedButton(
                      child: Text('주종'),
                      onPressed: () {},
                      // style: ButtonStyle(
                      //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      //         RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(20.0),
                      //         )
                      //     )
                      // ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: AppColor.mainColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("막걸리"),
                            const Text("탁주"),
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            if (type != '막걸리탁주') {
                              type = '막걸리탁주';
                              print(type);
                            }
                          });
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              const CircleBorder(),
                            ),
                            fixedSize: MaterialStateProperty.all(
                              const Size(75, 75),
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith((states){
                              if (type == "막걸리탁주"){
                                return AppColor.mainColor;
                              } else {
                                return Colors.white;
                              }
                            }),
                            foregroundColor: MaterialStateProperty.resolveWith((states){
                              if (type == "막걸리탁주"){
                                return Colors.white;
                              }
                              else {
                                return AppColor.mainColor;
                              }
                            })
                        ),
                      ),
                      OutlinedButton(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('약주'),
                            const Text('청주'),
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            if (type != '약주청주') {
                              type = '약주청주';
                              print(type);
                            }
                          });
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              const CircleBorder(),
                            ),
                            fixedSize: MaterialStateProperty.all(
                              const Size(75, 75),
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith((states){
                              if (type == "약주청주"){
                                return AppColor.mainColor;
                              } else {
                                return Colors.white;
                              }
                            }),
                            foregroundColor: MaterialStateProperty.resolveWith((states){
                              if (type == "약주청주"){
                                return Colors.white;
                              }
                              else {
                                return AppColor.mainColor;
                              }
                            })
                        ),
                      ),
                      OutlinedButton(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("증류주"),
                            const Text("리큐르"),
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            if (type != '증류주리큐르') {
                              type = '증류주리큐르';
                              print(type);
                            }
                          });
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              const CircleBorder(),
                            ),
                            fixedSize: MaterialStateProperty.all(
                              const Size(75, 75),
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith((states){
                              if (type == "증류주리큐르"){
                                return AppColor.mainColor;
                              } else {
                                return Colors.white;
                              }
                            }),
                            foregroundColor: MaterialStateProperty.resolveWith((states){
                              if (type == "증류주리큐르"){
                                return Colors.white;
                              }
                              else {
                                return AppColor.mainColor;
                              }
                            })
                        ),
                      ),
                      OutlinedButton(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("와인"),
                            const Text("과일주"),
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            if (type != '와인과일주') {
                              type = '와인과일주';
                              print(type);
                            }
                          });
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              const CircleBorder(),
                            ),
                            fixedSize: MaterialStateProperty.all(
                              const Size(75, 75),
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith((states){
                              if (type == "와인과일주"){
                                return AppColor.mainColor;
                              } else {
                                return Colors.white;
                              }
                            }),
                            foregroundColor: MaterialStateProperty.resolveWith((states){
                              if (type == "와인과일주"){
                                return Colors.white;
                              }
                              else {
                                return AppColor.mainColor;
                              }
                            })
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              print(sweet+dosu+type);
              if (sweet == "낮음" && dosu == "낮음" && type=="막걸리탁주"){
                context.read<Alcohol>().changeAlcohol0();
              }
              else if (sweet == "낮음" && dosu == "높음" && type=="막걸리탁주"){
                context.read<Alcohol>().changeAlcohol1();
              }
              else if (sweet == "높음" && dosu == "낮음" && type=="막걸리탁주"){
                context.read<Alcohol>().changeAlcohol2();
              }
              else if (sweet == "높음" && dosu == "높음" && type=="막걸리탁주"){
                context.read<Alcohol>().changeAlcohol3();
              }
              else if (sweet == "낮음" && dosu == "낮음" && type=="약주청주"){
                context.read<Alcohol>().changeAlcohol4();
              }
              else if (sweet == "낮음" && dosu == "높음" && type=="약주청주"){
                context.read<Alcohol>().changeAlcohol5();
              }
              else if (sweet == "높음" && dosu == "낮음" && type=="약주청주"){
                context.read<Alcohol>().changeAlcohol6();
              }
              else if (sweet == "높음" && dosu == "높음" && type=="약주청주"){
                context.read<Alcohol>().changeAlcohol7();
              }
              else if (sweet == "낮음" && dosu == "낮음" && type=="증류주리큐르"){
                context.read<Alcohol>().changeAlcohol8();
              }
              else if (sweet == "낮음" && dosu == "높음" && type=="증류주리큐르"){
                context.read<Alcohol>().changeAlcohol9();
              }
              else if (sweet == "높음" && dosu == "낮음" && type=="증류주리큐르"){
                context.read<Alcohol>().changeAlcohol10();
              }
              else if (sweet == "높음" && dosu == "높음" && type=="증류주리큐르"){
                context.read<Alcohol>().changeAlcohol11();
              }
              else if (sweet == "낮음" && dosu == "낮음" && type=="와인과실주"){
                context.read<Alcohol>().changeAlcohol12();
              }
              else if (sweet == "낮음" && dosu == "높음" && type=="와인과실주"){
                context.read<Alcohol>().changeAlcohol13();
              }
              else if (sweet == "높음" && dosu == "낮음" && type=="와인과실주"){
                context.read<Alcohol>().changeAlcohol14();
              }
              else if (sweet == "높음" && dosu == "높음" && type=="와인과실주"){
                context.read<Alcohol>().changeAlcohol15();
              }

              //Navigator.push(context,
                  //MaterialPageRoute(builder: (context)=>const AlcoholsuggestionPage()));
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SuggestAlcoholPage()));
            },
            child: Text('알고리주!'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.mainColor,
            ),
          )
        ],
      ),
    );
  }
}
