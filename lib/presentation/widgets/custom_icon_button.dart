import 'package:festiva/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final VoidCallback? onPressed;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.size = 42,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        customBorder: CircleBorder(),
        child: Ink(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: AppColors.colorB3,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.colorB4,
              width: 2,
            ),
          ),
          child: Center(
            child: Icon(
              icon,
              color: Colors.white,
              size: size * 0.6,
            ),
          ),
        ),
      ),
    );
  }
}
