import 'package:festiva/presentation/components/components.dart';
import 'package:festiva/presentation/pages/home/components/search_component.dart';
import 'package:festiva/presentation/providers/event_provider.dart';
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
      final pr = Provider.of<EventProvider>(context, listen: false);
      pr.getEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    return AppScaffold(
      appBar: CustomAppBar(
        title: "Events",
        detail: "What plans do we have?",
        hideBackButton: true,
      ),
      child: Column(
        spacing: 16,
        children: [
          SearchComponent(),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemCount: provider.events.length,
              itemBuilder: (context, index) {
                final event = provider.events[index];
                return CardEvent(event: event);
              },
            ),
          )
        ],
      ),
    );
  }
}
