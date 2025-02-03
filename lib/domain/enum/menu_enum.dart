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
        return Icons.map;
      case MenuEnum.events:
        return Icons.event;
      case MenuEnum.home:
        return Icons.home;
      case MenuEnum.clubs:
        return Icons.group;
      case MenuEnum.preferences:
        return Icons.settings;
    }
  }
}
