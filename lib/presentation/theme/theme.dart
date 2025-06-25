import 'package:festiva/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

export 'package:festiva/presentation/theme/colors.dart';
export 'package:festiva/presentation/theme/text_styles.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  primaryColor: AppColors.colorB1,
  appBarTheme: const AppBarTheme(),
  colorScheme: AppColors.colorScheme,
  scaffoldBackgroundColor: AppColors.colorB1,
  dialogTheme: DialogThemeData(backgroundColor: AppColors.colorB1),
  cardTheme: const CardThemeData(
    color: AppColors.colorB1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
);
