import 'package:festiva/domain/model/club/club_schedule.dart';
import 'package:festiva/presentation/providers/club_provider.dart';
import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/widgets/custom_icon_button.dart';
import 'package:festiva/presentation/widgets/widgets.dart';
import 'package:festiva/util/date_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClubSchedulePage extends StatefulWidget {
  final int clubId;

  const ClubSchedulePage({
    super.key,
    required this.clubId,
  });

  @override
  State<ClubSchedulePage> createState() => _ClubSchedulePageState();
}

class _ClubSchedulePageState extends State<ClubSchedulePage> {
  List<ClubSchedule> schedules = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchClubSchedules();
    });
  }

  Future<void> fetchClubSchedules() async {
    final provider = Provider.of<ClubProvider>(context, listen: false);
    final list = await provider.getClubSchedules(widget.clubId);
    setState(() {
      schedules = list;
    });
  }

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
                  text1: schedule.openingTime.format(
                    pattern: 'HH:mm',
                  ),
                  text2: schedule.closingTime.format(
                    pattern: 'HH:mm',
                  ),
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
