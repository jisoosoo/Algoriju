import 'package:flutter/material.dart';
import 'dart:math';

class Tests with ChangeNotifier {
  List<int> types = [0,0,0,0];
  String results = '';
  String drinks = '';
  String food = '';

  void inc1(){
    types[0]++;
    notifyListeners();
  }

  void inc2(){
    types[1]++;
    notifyListeners();
  }

  void inc3(){
    types[2]++;
    notifyListeners();
  }

  void inc4(){
    types[3]++;
    notifyListeners();
  }

  void setResult() {
    int midx = 0;
    for (int i = 0; i < 4; i++) {
      if (types[i] > types[midx]) {
        midx = i;
      } else if (types[i] == types[midx]) {
        int temp = Random().nextInt(2);
        if (temp == 2) {
          midx = i;
        }
      }
    }

    switch (midx) {
      case 0:
        results = '태양인';
        drinks = '고흥유자주';
        food = '멕시칸 샐러드';
        break;
      case 1:
        results = '소양인';
        drinks = '지란지교무화과주';
        food = '돼지고기 김치찜';
        break;
      case 2:
        results = '태음인';
        drinks = '매실원주';
        food = '빵';
        break;
      case 3:
        results = '소음인';
        drinks = '금과명주';
        food = '삼계탕';
        break;
    }
    notifyListeners();
  }
}