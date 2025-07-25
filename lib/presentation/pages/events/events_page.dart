import 'package:festiva/presentation/components/components.dart';
import 'package:festiva/presentation/pages/events/events_provider.dart';
import 'package:festiva/presentation/pages/events/components/events_categories.dart';
import 'package:festiva/presentation/pages/home/components/search_component.dart';
import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/theme/text_styles.dart';
import 'package:festiva/presentation/widgets/app_scaffold.dart';
import 'package:festiva/presentation/widgets/custom_app_bar.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SearchComponent(),
          ),
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
                    padding: const EdgeInsets.symmetric(horizontal: 24),
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
}
