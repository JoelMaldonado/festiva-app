import 'package:festiva/presentation/components/components.dart';
import 'package:festiva/presentation/pages/events/events_provider.dart';
import 'package:festiva/presentation/pages/events/components/events_categories.dart';
import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/theme/text_styles.dart';
import 'package:festiva/presentation/widgets/app_scaffold.dart';
import 'package:festiva/presentation/widgets/custom_app_bar.dart';
import 'package:festiva/util/date_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EventsProvider>(context, listen: false).getEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventsProvider>(context);
    return AppScaffold(
      padding: EdgeInsets.zero,
      appBar: CustomAppBar(
        title: "Events",
        detail: "What plans do we have?",
        hideBackButton: true,
      ),
      child: Column(
        spacing: 16,
        children: [
          const SizedBox.shrink(),
          //_calendar(),
          EventsCategories(),
          provider.listEventsFiltered.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    "No events found",
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.colorT2,
                    ),
                  ),
                )
              : Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1,
                    ),
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 24,
                    ),
                    itemCount: provider.listEventsFiltered.length,
                    itemBuilder: (context, index) {
                      final event = provider.listEventsFiltered[index];
                      return CardEvent(event: event);
                    },
                  ),
                )
        ],
      ),
    );
  }

  Padding _calendar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateTime.now().format(pattern: "MMMM yyyy"),
            style: AppTextStyles.headline.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.colorT1,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            spacing: 16,
            children: [
              _date(DateTime.now()),
              _date(DateTime.now().add(const Duration(days: 1))),
              _date(DateTime.now().add(const Duration(days: 2))),
              _date(DateTime.now().add(const Duration(days: 3))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _date(DateTime date) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.colorB3,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.colorT1,
          width: 1,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              date.format(pattern: "EEE").toUpperCase(),
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
      ),
    );
  }
}
