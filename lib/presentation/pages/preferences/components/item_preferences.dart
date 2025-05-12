import 'package:festiva_flutter/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class ItemPreferences extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool withArrow;
  final VoidCallback onTap;

  const ItemPreferences({
    super.key,
    required this.icon,
    required this.title,
    this.withArrow = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.colorB3,
          borderRadius: BorderRadius.circular(4),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(4),
          splashColor: Colors.white.withValues(alpha: 0.2),
          highlightColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              spacing: 16,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.colorB4,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.callout.copyWith(
                      color: AppColors.colorT1,
                    ),
                  ),
                ),
                if (withArrow) const Icon(Icons.chevron_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
