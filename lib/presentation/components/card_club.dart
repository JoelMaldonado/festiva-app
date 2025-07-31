import 'package:festiva/presentation/pages/club_detail/club_detail_page.dart';
import 'package:festiva/presentation/theme/theme.dart';
import 'package:festiva/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardClub extends StatelessWidget {
  final int id;
  final String name;
  final String? coverUrl;
  final String? logoUrl;
  final String? address;
  final bool? isOpen;

  const CardClub({
    super.key,
    required this.id,
    required this.name,
    required this.coverUrl,
    required this.logoUrl,
    required this.address,
    required this.isOpen,
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ClubDetailPage(idClub: id),
              ),
            );
          },
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
                      imageUrl: coverUrl,
                      width: double.infinity,
                      height: 132,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  if (isOpen != null)
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          color: isOpen!
                              ? AppColors.colorGreen
                              : AppColors.colorRed,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 2,
                        ),
                        child: Text(isOpen! ? "Open" : "Closed"),
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
                      imageUrl: logoUrl,
                      width: 42,
                      height: 42,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: AppTextStyles.callout.copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppColors.colorT1,
                          ),
                        ),
                        Text(
                          address ?? 'Unknown',
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
