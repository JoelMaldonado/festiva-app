import 'package:festiva/presentation/components/card_event.dart';
import 'package:festiva/presentation/pages/events_list/components/events_categories.dart';
import 'package:festiva/presentation/pages/events_list/events_list_provider.dart';
import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/theme/text_styles.dart';
import 'package:festiva/presentation/widgets/app_scaffold.dart';
import 'package:festiva/presentation/widgets/custom_app_bar.dart';
import 'package:festiva/util/date_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsListPage extends StatefulWidget {
  const EventsListPage({super.key});

  @override
  State<EventsListPage> createState() => _EventsListPageState();
}

class _EventsListPageState extends State<EventsListPage> {
  final _scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<EventsListProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.init();
    });

    _scrollCtrl.addListener(() {
      final position = _scrollCtrl.position;
      if (position.maxScrollExtent - position.pixels <= 300.0) {
        provider.fetchNextPage();
      }
    });
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventsListProvider>(context);
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
          _calendar(
            dates: provider.dates,
            selectedDate: provider.selectedDate,
            onDateSelected: provider.setDateSelected,
          ),
          EventsCategories(
            listCategories: provider.listCategories,
            selectedCategory: provider.selectedCategory,
            onCategorySelected: provider.setCategorySelected,
          ),
          provider.items.isEmpty
              ? _notEventsFound()
              : Expanded(
                  child: GridView.builder(
                    controller: _scrollCtrl,
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
                    itemCount: provider.items.length,
                    itemBuilder: (context, index) {
                      final event = provider.items[index];
                      return CardEvent(
                        event: event,
                        showDate: provider.selectedDate == null,
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }

  Padding _notEventsFound() {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Text(
        "No events found",
        style: AppTextStyles.body.copyWith(
          color: AppColors.colorT2,
        ),
      ),
    );
  }

  Widget _calendar({
    required List<DateTime> dates,
    required DateTime? selectedDate,
    required Function(DateTime? date) onDateSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            DateTime.now().format(pattern: "MMMM yyyy"),
            style: AppTextStyles.headline.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.colorT1,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 60,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: dates.length,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemBuilder: (context, index) {
              final item = dates[index];
              return _date(
                selectedDate == item,
                item,
                onDateSelected,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 8),
          ),
        ),
      ],
    );
  }

  Widget _date(
    bool isSelected,
    DateTime date,
    Function(DateTime? date) onDateSelected,
  ) {
    return InkWell(
      onTap: () {
        if (isSelected) {
          onDateSelected(null);
          return;
        }
        onDateSelected(date);
      },
      child: Ink(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.colorB3,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isSelected ? AppColors.colorP1 : AppColors.colorT1,
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
      ),
    );
  }
}
