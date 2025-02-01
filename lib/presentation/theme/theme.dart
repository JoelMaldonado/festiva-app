import 'package:festiva_flutter/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

export 'package:festiva_flutter/presentation/theme/colors.dart';
export 'package:festiva_flutter/presentation/theme/text_styles.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  primaryColor: AppColors.colorP1,
  appBarTheme: const AppBarTheme(),
  colorScheme: AppColors.colorScheme,
  scaffoldBackgroundColor: Colors.white,
  dialogBackgroundColor: Colors.white,
  cardTheme: const CardTheme(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
);
