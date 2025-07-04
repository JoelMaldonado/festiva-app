import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/theme/text_styles.dart';
import 'package:festiva/presentation/widgets/app_image_network.dart';
import 'package:flutter/material.dart';

class CardItemList extends StatelessWidget {
  final String? imageUrl;
  final String label;
  final String detail;
  final VoidCallback onTap;

  const CardItemList({
    super.key,
    this.imageUrl,
    required this.label,
    required this.detail,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.colorB3,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.colorB4,
              width: 2,
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            spacing: 12,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AppImageNetwork(
                  imageUrl: imageUrl,
                  width: 64,
                  height: 64,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: AppTextStyles.callout.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      detail,
                      style: AppTextStyles.subhead.copyWith(
                        color: AppColors.colorT2,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
              )
            ],
          ),
        ),
      ),
    );
  }
}
