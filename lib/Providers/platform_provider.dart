import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformProvider extends ChangeNotifier {
  bool isIos = true;
  DateTime initialDate = DateTime.now();
  TimeOfDay initialTime = TimeOfDay.now();
  int selected = 0;

  void changePlatform(bool n) {
    isIos = n;
    notifyListeners();
  }

  void pickDate(DateTime n) {
    initialDate = n;
    notifyListeners();
  }

  void pickTime(TimeOfDay n) {
    initialTime = n;
    notifyListeners();
  }

  void selectedPage(int n) {
    selected = n;
    notifyListeners();
  }
}
