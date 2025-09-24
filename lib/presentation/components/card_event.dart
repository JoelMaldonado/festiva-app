import 'package:festiva/app/router.dart';
import 'package:festiva/domain/model/event.dart';
import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/theme/text_styles.dart';
import 'package:festiva/presentation/widgets/widgets.dart';
import 'package:festiva/util/date_functions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardEvent extends StatelessWidget {
  final Event event;
  final bool showDate;

  const CardEvent({
    super.key,
    required this.event,
    this.showDate = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(
            AppRoutes.detailEvent,
            extra: event.id.toString(),
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            color: AppColors.colorB4,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: AppImageNetwork(
                        imageUrl: event.imageUrl,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (showDate)
                      Positioned(
                        left: 16,
                        top: 16,
                        child: _date(event.eventDate),
                      ),
                    Positioned(
                      left: 8,
                      bottom: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.colorB3,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: AppColors.colorP1,
                            width: 1,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 2,
                        ),
                        child: Text(
                          event.nameEventCategory ?? "No Category",
                          style: AppTextStyles.caption1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 56,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title,
                        style: AppTextStyles.footnote.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.colorT1,
                        ),
                        maxLines: 1,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: AppColors.colorT2,
                            size: 14,
                          ),
                          SizedBox(width: 4),
                          Text(
                            event.nameClub ?? "Unknown",
                            style: AppTextStyles.caption1.copyWith(
                              color: AppColors.colorT2,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _date(DateTime? date) {
    if (date == null) {
      return SizedBox.shrink();
    }
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.colorB3,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.colorT1,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            date.format(pattern: "MMM").toUpperCase(),
            style: AppTextStyles.caption1,
          ),
          Text(
            date.format(pattern: "dd"),
            style: AppTextStyles.title3.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
