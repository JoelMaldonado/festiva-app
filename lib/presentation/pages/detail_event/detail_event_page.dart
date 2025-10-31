import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:festiva/presentation/components/card_event_schedule.dart';
import 'package:festiva/presentation/components/item_detail.dart';
import 'package:festiva/presentation/pages/detail_club/detail_club_page.dart';
import 'package:festiva/presentation/pages/detail_event/components/ticket_cta_card.dart';
import 'package:festiva/presentation/providers/event_provider.dart';
import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/widgets/custom_expandable_text.dart';
import 'package:festiva/presentation/widgets/custom_image_network.dart';
import 'package:festiva/presentation/widgets/widgets.dart';
import 'package:festiva/util/date_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class DetailEventPage extends StatefulWidget {
  final String idEvent;
  const DetailEventPage({
    super.key,
    required this.idEvent,
  });

  @override
  State<DetailEventPage> createState() => _DetailEventPageState();
}

class _DetailEventPageState extends State<DetailEventPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EventProvider>(context, listen: false)
          .getEventByScheduleId(widget.idEvent);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    return AppScaffold(
      isLoadingScreen: provider.isLoadingEvent,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          spacing: 12,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: CustomImageNetwork(
                imageUrl: provider.event?.imageUrl,
                isExpandable: true,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: Text(
                    provider.event?.title ?? "",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: AppColors.colorT1,
                    ),
                  ),
                ),
                /*
                AppFloatingActionButton(
                  onPressed: () {},
                  icon: Icons.favorite_outline,
                ),
                AppFloatingActionButton(
                  onPressed: () {
                    SharePlus.instance
                        .share(ShareParams(text: 'https://www.festiva.no/'));
                  },
                  icon: Icons.share_outlined,
                ),
                */
              ],
            ),
            CustomExpandableText(text: provider.event?.description ?? ""),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: provider.event?.categories
                        .map(
                          (c) => _categoryEvent(c.title),
                        )
                        .toList() ??
                    [],
              ),
            ),
            if (provider.event?.ticketUrl != null &&
                provider.event!.ticketUrl!.isNotEmpty)
              TicketCtaCard(
                purchaseUrl: provider.event!.ticketUrl!,
              ),
            if (provider.event?.eventDate != null)
              Row(
                spacing: 12,
                children: [
                  Expanded(
                    flex: 1,
                    child: ItemDetail(
                      icon: Icons.calendar_month_outlined,
                      title: "Date",
                      value: provider.event!.eventDate!.format(),
                      onLongPress: () {
                        if (kDebugMode) {
                          final event =
                              buildEvent(DateTime.now().add(Duration(days: 1)));
                          Add2Calendar.addEvent2Cal(event);
                        }
                      },
                    ),
                  ),
                  if (provider.event?.startTime != null)
                    Expanded(
                      flex: 2,
                      child: ItemDetail(
                        icon: Icons.schedule_outlined,
                        title: "Time",
                        value:
                            provider.event!.startTime!.format(pattern: 'HH:mm'),
                      ),
                    ),
                ],
              ),
            ItemDetail(
              icon: Icons.location_pin,
              title: "Address",
              value: provider.event?.location ?? "Unknown",
              onLongPress: kDebugMode
                  ? () {
                      if (provider.event?.location == null) return;
                      Fluttertoast.showToast(msg: "Text copied to clipboard");
                      Clipboard.setData(
                        ClipboardData(text: provider.event!.location!),
                      );
                    }
                  : null,
            ),
            if (provider.event?.clubId != null)
              ItemDetail(
                icon: Icons.explore_outlined,
                title: "Venue",
                value: provider.event!.clubName!,
                iconAction: Icons.chevron_right,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          DetailClubPage(idClub: provider.event!.clubId!),
                    ),
                  );
                },
              ),
            if (kDebugMode) CardEventSchedule(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _categoryEvent(String category) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 2,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.colorP1,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16)),
      child: Text(category),
    );
  }
}

// Duración del evento
Event buildEvent(DateTime startTime) {
  return Event(
    title: 'Mi Evento',
    description: 'Descripción opcional del evento',
    location: 'Ubicación opcional',
    startDate: startTime,
    endDate: startTime.add(Duration(hours: 2)),
  );
}
