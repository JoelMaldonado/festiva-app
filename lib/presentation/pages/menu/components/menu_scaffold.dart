import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/theme/text_styles.dart';
import 'package:festiva/presentation/widgets/app_floating_action_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MenuScaffold extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const MenuScaffold({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        top: 24,
        right: 24,
      ),
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 16,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.largeTitle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.colorT1,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: AppTextStyles.callout.copyWith(
                        color: AppColors.colorT2,
                      ),
                    ),
                  ],
                ),
              ),
              if (kDebugMode == false)
                AppFloatingActionButton(
                  onPressed: () {},
                  icon: Icons.logout_outlined,
                ),
            ],
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
