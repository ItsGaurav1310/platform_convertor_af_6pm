import 'package:flutter/cupertino.dart';

class PlatformProvider extends ChangeNotifier {
  bool isIos = true;
  DateTime initialDate = DateTime.now();

  void changePlatform(bool n) {
    isIos = n;
    notifyListeners();
  }

  void pickDate(DateTime n) {
    initialDate = n;
    notifyListeners();
  }
}
