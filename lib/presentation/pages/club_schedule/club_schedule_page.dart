import 'package:festiva/domain/model/club/club.dart';
import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/widgets/custom_icon_button.dart';
import 'package:festiva/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ClubSchedulePage extends StatelessWidget {
  final List<ClubSchedule> schedules;

  const ClubSchedulePage({
    super.key,
    required this.schedules,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        spacing: 12,
        children: [
          SizedBox(
            height: 32,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomIconButton(
                    icon: Icons.arrow_back,
                    size: 32,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Opening Hours",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Business hours may vary due to certain situations or holidays. Please keep this in mind.",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.colorT2,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: schedules.length,
              itemBuilder: (context, index) {
                final schedule = schedules[index];
                return item(
                  name: schedule.name,
                  text1: schedule.openingTime,
                  text2: schedule.closingTime,
                );
              },
              separatorBuilder: (c, i) => const SizedBox(height: 8),
            ),
          ),
        ],
      ),
    );
  }

  Widget item({
    required String name,
    required String text1,
    required String text2,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF555555).withValues(alpha: 0.2),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "$text1 - $text2",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.colorT2,
            ),
          ),
        ],
      ),
    );
  }
}
