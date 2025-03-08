import 'package:festiva_flutter/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

export 'package:festiva_flutter/presentation/theme/colors.dart';
export 'package:festiva_flutter/presentation/theme/text_styles.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  primaryColor: AppColors.colorB1,
  appBarTheme: const AppBarTheme(),
  colorScheme: AppColors.colorScheme,
  scaffoldBackgroundColor: AppColors.colorB1,
  dialogBackgroundColor: AppColors.colorB1,
  cardTheme: const CardTheme(
    color: AppColors.colorB1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
);
