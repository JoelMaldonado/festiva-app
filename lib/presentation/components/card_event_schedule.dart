import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/util/date_functions.dart';
import 'package:flutter/material.dart';

class CardEventSchedule extends StatelessWidget {
  const CardEventSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.colorB3,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        spacing: 12,
        children: [
          _date(
            DateTime.now(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 8,
                children: [
                  Icon(
                    Icons.access_time,
                    color: AppColors.colorT1,
                  ),
                  Text("18:00\t\t\t•\t\t\t30-90 min")
                ],
              ),
              Text(
                "Korsgara 31A, 0552 Stockholm",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: AppColors.colorT2,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _date2(DateTime date) {
    return Container(
      width: 72,
      height: 90,
      decoration: BoxDecoration(
        color: AppColors.colorB4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              date.format(pattern: "EEE"),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColors.colorT2,
              ),
            ),
            Text(
              date.format(pattern: "dd"),
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: AppColors.colorT1,
              ),
            ),
            Text(
              date.format(pattern: "MMM"),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: AppColors.colorT3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _date(DateTime date) {
    return Container(
      width: 72,
      height: 90,
      decoration: BoxDecoration(
        color: AppColors.colorB4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              date.format(pattern: "MMM"),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColors.colorT2,
              ),
            ),
            Text(
              date.format(pattern: "dd"),
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: AppColors.colorT1,
              ),
            ),
            Text(
              "18:00",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: AppColors.colorT3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
