import 'package:festiva_flutter/domain/enum/menu_enum.dart';
import 'package:festiva_flutter/presentation/pages/clubs/clubs_page.dart';
import 'package:festiva_flutter/presentation/pages/home/pages/home_page.dart';
import 'package:festiva_flutter/presentation/pages/menu/components/menu_bottom.dart';
import 'package:festiva_flutter/presentation/pages/menu/menu_provider.dart';
import 'package:festiva_flutter/presentation/theme/theme.dart';
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
        child: Column(
          children: [
            Expanded(
              child: switch (provider.menuSelected) {
                MenuEnum.maps => Text("data"),
                MenuEnum.events => Text("Prueba"),
                MenuEnum.home => HomePage(),
                MenuEnum.clubs => ClubsPage(),
                MenuEnum.preferences => Text("data"),
              },
            ),
            MenuBottom(
              selected: provider.menuSelected,
              onSelected: provider.setMenuSelected,
            ),
          ],
        ),
      ),
    );
  }
}
