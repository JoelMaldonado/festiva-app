import 'package:festiva/domain/enum/menu_enum.dart';
import 'package:festiva/presentation/pages/clubs_map/clubs_map_page.dart';
import 'package:festiva/presentation/pages/clubs/clubs_page.dart';
import 'package:festiva/presentation/pages/events/events_page.dart';
import 'package:festiva/presentation/pages/home/home_page.dart';
import 'package:festiva/presentation/pages/maintenance/maintenance_page.dart';
import 'package:festiva/presentation/pages/menu/components/menu_bottom.dart';
import 'package:festiva/presentation/pages/menu/menu_provider.dart';
import 'package:festiva/presentation/pages/preferences/preferences_page.dart';
import 'package:festiva/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.colorB3,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MenuProvider>(context, listen: false).getAppScreenFlags();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuProvider>(context);

    final pages = [
      ClubsMapPage(), // index 0
      EventsPage(), // index 1
      HomePage(
        toClubs: () => provider.setMenuSelected(MenuEnum.clubs),
        toEvents: () => provider.setMenuSelected(MenuEnum.events),
      ), // index 2
      ClubsPage(), // index 3
      PreferencesPage(),
    ];

    final selectedIndex = switch (provider.menuSelected) {
      MenuEnum.maps => 0,
      MenuEnum.events => 1,
      MenuEnum.home => 2,
      MenuEnum.clubs => 3,
      MenuEnum.preferences => 4,
    };

    if (provider.isMenuActive == false) {
      return MaintenancePage(
        onRetry: () {
          provider.getAppScreenFlags();
        },
      );
    }
    return Scaffold(
      backgroundColor: AppColors.colorB1,
      body: SafeArea(
        child: IndexedStack(index: selectedIndex, children: pages),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        left: false,
        right: false,
        bottom: true,
        child: MenuBottom(
          selected: provider.menuSelected,
          onSelected: provider.setMenuSelected,
        ),
      ),
    );
  }
}
