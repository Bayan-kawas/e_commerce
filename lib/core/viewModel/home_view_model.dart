import 'package:flutter/cupertino.dart';



class HomeViewModel with ChangeNotifier{
  int selectedItem=0;

  void changeSelectedItem(int currentIndex){
    selectedItem=currentIndex;
    notifyListeners();
  }

}