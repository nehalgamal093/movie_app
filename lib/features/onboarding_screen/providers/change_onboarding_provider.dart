import 'package:flutter/cupertino.dart';

class ChangeOnboardingProvider extends ChangeNotifier{
  int index =0;
  void changeIndex(int val){
    index = val;
    notifyListeners();
  }

}