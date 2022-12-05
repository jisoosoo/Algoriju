import 'package:algoriju/suggestedalcohol.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:algoriju/alcohol.dart';
import 'style.dart';

class AlcoholPage extends StatefulWidget {
  const AlcoholPage({Key? key}): super(key: key);

  @override
  State<AlcoholPage> createState() => _AlcoholFormState();
}

class _AlcoholFormState extends State<AlcoholPage> {
  var sweet ='낮음';
  var dosu = '낮음';
  var type = '막걸리탁주';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '전통주와 안주 추천',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColor.mainColor,
        actions: [
          IconButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout)
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Container(
            width: 59,
            height: 26,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.mainColor,
            ),
            margin: const EdgeInsets.only(left: 16.0),
            child: const Text(
              style: TextStyle(color: Colors.white),
              '당도',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
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
                      const Size(65, 65),
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
                child: const Text(
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  '낮음',
                ),
              ),
              OutlinedButton(
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
                      const Size(65, 65),
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
                child: const Text(
                  style: TextStyle(
                      fontSize: 12,
                  ),
                  '높음'
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.only(left: 17.0, right: 17.0),
            child: const Divider(color: Colors.grey, thickness: 1.0),
          ),
          const SizedBox(height: 10,),
          Container(
            width: 59,
            height: 26,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.mainColor,
            ),
            margin: const EdgeInsets.only(left: 16.0),
            child: const Text(
              style: TextStyle(color: Colors.white),
              '도수',
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
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
                          const Size(65, 65),
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
                    child: const Text(
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        '낮음'
                    ),
                  ),
                  OutlinedButton(
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
                        const Size(65, 65),
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
                    child: const Text(
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        '높음'
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.only(left: 17.0, right: 17.0),
            child: const Divider(color: Colors.grey, thickness: 1.0),
          ),
          const SizedBox(height: 10,),
          Container(
            width: 59,
            height: 26,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.mainColor,
            ),
            margin: const EdgeInsets.only(left: 16.0),
            child: const Text(
              style: TextStyle(color: Colors.white),
              '주종',
            ),
          ),
          const SizedBox(height: 10,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        if (type != '막걸리탁주') {
                          type = '막걸리탁주';
                        }
                      });
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          const CircleBorder(),
                        ),
                        fixedSize: MaterialStateProperty.all(
                          const Size(65, 65),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("막걸리",style: TextStyle(fontSize: 11,),),
                        Text("탁주",style: TextStyle(fontSize: 11,),),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        if (type != '약주청주') {
                          type = '약주청주';
                        }
                      });
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          const CircleBorder(),
                        ),
                        fixedSize: MaterialStateProperty.all(
                          const Size(65, 65),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('약주',style: TextStyle(fontSize: 11,),),
                        Text('청주',style: TextStyle(fontSize: 11,),),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        if (type != '증류주리큐르') {
                          type = '증류주리큐르';
                        }
                      });
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          const CircleBorder(),
                        ),
                        fixedSize: MaterialStateProperty.all(
                          const Size(65, 65),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("증류주",style: TextStyle(fontSize: 11,),),
                        Text("리큐르",style: TextStyle(fontSize: 11,),),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      setState(() {
                        if (type != '와인과일주') {
                          type = '와인과일주';
                        }
                      });
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          const CircleBorder(),
                        ),
                        fixedSize: MaterialStateProperty.all(
                          const Size(65, 65),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("와인",style: TextStyle(fontSize: 11,),),
                        Text("과일주",style: TextStyle(fontSize: 11,),),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.mainColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(12.0),
                ),
                onPressed: () async {
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SuggestAlcoholPage()));
                },
                child: const Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  '알고리주!',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
