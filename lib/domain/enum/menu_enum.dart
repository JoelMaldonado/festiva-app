import 'package:flutter/material.dart';

enum MenuEnum {
  maps,
  events,
  home,
  clubs,
  preferences,
}

extension MenuEnumExtension on MenuEnum {
  IconData get icon {
    switch (this) {
      case MenuEnum.maps:
        return Icons.location_on;
      case MenuEnum.events:
        return Icons.celebration;
      case MenuEnum.home:
        return Icons.home;
      case MenuEnum.clubs:
        return Icons.apartment;
      case MenuEnum.preferences:
        return Icons.manage_accounts;
    }
  }
}
