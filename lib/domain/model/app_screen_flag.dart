enum AppScreenKeys {
  app,
  home,
}

class AppScreenFlag {
  final int id;
  final AppScreenKeys? screen;
  final bool isActive;
  final DateTime updatedAt;

  AppScreenFlag({
    required this.id,
    required this.screen,
    required this.isActive,
    required this.updatedAt,
  });
}
