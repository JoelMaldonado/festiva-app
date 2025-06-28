import 'package:festiva/domain/enum/menu_enum.dart';
import 'package:festiva/presentation/pages/clubs_map/clubs_map_page.dart';
import 'package:festiva/presentation/pages/clubs_page.dart';
import 'package:festiva/presentation/pages/events_page.dart';
import 'package:festiva/presentation/pages/home/pages/home_page.dart';
import 'package:festiva/presentation/pages/menu/components/menu_bottom.dart';
import 'package:festiva/presentation/pages/menu/menu_provider.dart';
import 'package:festiva/presentation/pages/preferences/preferences_page.dart';
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

    return Scaffold(
      backgroundColor: AppColors.colorB1,
      body: SafeArea(
        child: switch (provider.menuSelected) {
          MenuEnum.maps => ClubsMapPage(),
          MenuEnum.events => EventsPage(),
          MenuEnum.home => HomePage(
              toClubs: () => provider.setMenuSelected(MenuEnum.clubs),
              toEvents: () => provider.setMenuSelected(MenuEnum.events),
            ),
          MenuEnum.clubs => ClubsPage(),
          //MenuEnum.preferences => PreferencesPage(),
        },
      ),
      bottomNavigationBar: MenuBottom(
        selected: provider.menuSelected,
        onSelected: provider.setMenuSelected,
      ),
    );
  }
}
