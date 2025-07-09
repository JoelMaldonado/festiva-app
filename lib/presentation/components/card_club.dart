import 'package:festiva/domain/model/club/club_summary.dart';
import 'package:festiva/presentation/theme/theme.dart';
import 'package:festiva/presentation/widgets/widgets.dart';
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
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: AppColors.colorB4,
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          splashColor: Colors.white.withValues(alpha: .2),
          highlightColor: Colors.transparent,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: AppImageNetwork(
                      imageUrl: club.coverUrl,
                      width: double.infinity,
                      height: 132,
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
                  spacing: 8,
                  children: [
                    AppImageNetwork(
                      imageUrl: club.logoUrl,
                      width: 42,
                      height: 42,
                      fit: BoxFit.cover,
                    ),
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
    );
  }
}
