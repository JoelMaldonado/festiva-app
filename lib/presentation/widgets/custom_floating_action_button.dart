import 'package:festiva/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const CustomFloatingActionButton({
    super.key,
    required this.icon,
    this.backgroundColor = AppColors.colorP1,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: Ink(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
