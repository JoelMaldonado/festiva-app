import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int categorySelected = 0;

  setCategorySelected(int index) {
    categorySelected = index;
    notifyListeners();
  }
}
