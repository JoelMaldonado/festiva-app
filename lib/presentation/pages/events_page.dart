import 'package:festiva_flutter/presentation/components/components.dart';
import 'package:festiva_flutter/presentation/pages/menu/components/menu_scaffold.dart';
import 'package:festiva_flutter/presentation/providers/event_provider.dart';
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
    return MenuScaffold(
      title: "Eventos",
      subtitle: "¿Qúe planes realizamos?",
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.events.length,
              itemBuilder: (context, index) {
                final event = provider.events[index];
                return CardEvent(
                  event: event,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
