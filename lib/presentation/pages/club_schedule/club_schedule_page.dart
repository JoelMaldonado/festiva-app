import 'package:festiva_flutter/domain/model/club/club.dart';
import 'package:festiva_flutter/presentation/widgets/widgets.dart';
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
      title: "Schedule",
      child: Column(
        spacing: 8,
        children: [
          item(
            name: "Day",
            text1: "Open",
            text2: "Close",
            isTitle: true,
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
                  isTitle: false,
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
    required bool isTitle,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text1,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text2,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
