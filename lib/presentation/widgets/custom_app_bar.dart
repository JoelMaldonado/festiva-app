import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? detail;
  final bool hideBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.detail,
    this.hideBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      left: true,
      right: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12,
          left: 24,
          right: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 12,
              children: [
                if (!hideBackButton)
                  _iconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icons.arrow_back,
                  ),
                Text(
                  title,
                  style: AppTextStyles.largeTitle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            if (detail != null)
              Text(
                detail!,
                style: AppTextStyles.callout.copyWith(
                  color: AppColors.colorT2,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Material _iconButton({
    required VoidCallback onPressed,
    required IconData icon,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        customBorder: CircleBorder(),
        child: Ink(
          width: 42,
          height: 42,
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
              size: 24,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
