import 'package:festiva_flutter/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class ItemPreferences extends StatelessWidget {
  final IconData icon;
  final String title;

  const ItemPreferences({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.colorB3,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.white.withValues(alpha: 0.2),
        highlightColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            spacing: 16,
            children: [
              Icon(icon),
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.callout.copyWith(
                    color: AppColors.colorT1,
                  ),
                ),
              ),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
