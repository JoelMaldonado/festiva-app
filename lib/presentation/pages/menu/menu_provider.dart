import 'package:festiva/domain/enum/menu_enum.dart';
import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  MenuEnum menuSelected = MenuEnum.home;

  setMenuSelected(MenuEnum menu) {
    if (menuSelected == menu) return;
    menuSelected = menu;
    notifyListeners();
  }
}
