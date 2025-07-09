import 'package:festiva/domain/enum/menu_enum.dart';
import 'package:festiva/presentation/pages/clubs_map/clubs_map_page.dart';
import 'package:festiva/presentation/pages/clubs/clubs_page.dart';
import 'package:festiva/presentation/pages/events/events_page.dart';
import 'package:festiva/presentation/pages/home/home_page.dart';
import 'package:festiva/presentation/pages/menu/components/menu_bottom.dart';
import 'package:festiva/presentation/pages/menu/menu_provider.dart';
import 'package:festiva/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuProvider>(context);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.colorB3,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    final pages = [
      ClubsMapPage(), // index 0
      EventsPage(), // index 1
      HomePage(
        toClubs: () => provider.setMenuSelected(MenuEnum.clubs),
        toEvents: () => provider.setMenuSelected(MenuEnum.events),
      ), // index 2
      ClubsPage(), // index 3
    ];

    final selectedIndex = switch (provider.menuSelected) {
      MenuEnum.maps => 0,
      MenuEnum.events => 1,
      MenuEnum.home => 2,
      MenuEnum.clubs => 3,
    };

    return Scaffold(
      backgroundColor: AppColors.colorB1,
      body: SafeArea(
          child: IndexedStack(
        index: selectedIndex,
        children: pages,
      )),
      bottomNavigationBar: MenuBottom(
        selected: provider.menuSelected,
        onSelected: provider.setMenuSelected,
      ),
    );
  }
}
