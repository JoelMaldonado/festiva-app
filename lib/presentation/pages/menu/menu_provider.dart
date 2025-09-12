import 'package:festiva/domain/enum/menu_enum.dart';
import 'package:festiva/domain/model/app_screen_flag.dart';
import 'package:festiva/domain/repository/ui_repository.dart';
import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  final UiRepository uiRepository;

  MenuProvider({
    required this.uiRepository,
  });

  MenuEnum menuSelected = MenuEnum.home;

  setMenuSelected(MenuEnum menu) {
    if (menuSelected == menu) return;
    menuSelected = menu;
    notifyListeners();
  }

  bool? isMenuActive;

  getAppScreenFlags() async {
    final res = await uiRepository.fetchAppScreenFlags();
    res.fold((l) {}, (r) {
      isMenuActive =
          r.firstWhere((e) => e.screen == AppScreenKeys.app).isActive;
      notifyListeners();
    });
  }
}
