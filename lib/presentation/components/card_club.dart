import 'package:festiva_flutter/domain/model/club/club_summary.dart';
import 'package:festiva_flutter/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class CardClub extends StatelessWidget {
  final ClubSummary club;
  final VoidCallback onPressed;
  const CardClub({
    super.key,
    required this.club,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        width: 400,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          splashColor: Colors.white.withValues(alpha: .2),
          highlightColor: Colors.white.withValues(alpha: .1),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.colorB4,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: Image.network(
                        club.logoUrl,
                        width: double.infinity,
                        height: 140,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.colorGreen,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 2,
                        ),
                        child: Text("Abierto"),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Image.network(
                        club.logoUrl,
                        width: 36,
                        height: 36,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            club.name,
                            style: AppTextStyles.callout.copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.colorT1,
                            ),
                          ),
                          Text(
                            "Discoteca",
                            style: AppTextStyles.footnote.copyWith(
                              color: AppColors.colorT2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
