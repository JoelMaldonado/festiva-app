import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';

class CardClubShimmer extends StatelessWidget {
  const CardClubShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.colorB3,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: CustomShimmer(
              width: double.infinity,
              height: 132,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              spacing: 8,
              children: [
                CustomShimmer(
                  width: 42,
                  height: 42,
                  borderRadius: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    CustomShimmer(
                      width: 120,
                      height: 16,
                    ),
                    CustomShimmer(
                      width: 80,
                      height: 12,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
