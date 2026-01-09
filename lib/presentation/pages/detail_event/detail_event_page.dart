import 'package:festiva/domain/model/event.dart';
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
import 'package:share_plus/share_plus.dart';
import 'package:add_2_calendar/add_2_calendar.dart' as calendar;

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
      context.read<EventProvider>().getEventById(widget.idEvent);
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
                imageUrl: provider.eventDetail?.imageUrl,
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
                    provider.eventDetail?.title ?? "",
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
                */
                AppFloatingActionButton(
                  onPressed: () {
                    final eventId = widget.idEvent;
                    final url = 'https://festiva.no/events/$eventId';
                    SharePlus.instance.share(
                      ShareParams(
                        text: url,
                      ),
                    );
                  },
                  icon: Icons.share_outlined,
                ),
              ],
            ),
            CustomExpandableText(text: provider.eventDetail?.description ?? ""),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: provider.eventDetail?.categories
                        .map(
                          (c) => _categoryEvent(c.title),
                        )
                        .toList() ??
                    [],
              ),
            ),
            if (provider.eventDetail?.ticketUrl != null &&
                provider.eventDetail!.ticketUrl!.isNotEmpty)
              TicketCtaCard(
                purchaseUrl: provider.eventDetail!.ticketUrl!,
              ),
            ItemDetail(
              icon: Icons.location_pin,
              title: "Address",
              value: provider.eventDetail?.location ?? "Unknown",
              onLongPress: kDebugMode
                  ? () {
                      if (provider.eventDetail?.location == null) return;
                      Fluttertoast.showToast(msg: "Text copied to clipboard");
                      Clipboard.setData(
                        ClipboardData(text: provider.eventDetail!.location),
                      );
                    }
                  : null,
            ),
            if (provider.eventDetail?.clubId != null)
              ItemDetail(
                icon: Icons.explore_outlined,
                title: "Venue",
                value: provider.eventDetail!.clubName,
                iconAction: Icons.chevron_right,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          DetailClubPage(idClub: provider.eventDetail!.clubId),
                    ),
                  );
                },
              ),
            if (provider.eventDetail?.schedules != null &&
                provider.eventDetail!.schedules.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  Text(
                    "Schedules",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColors.colorT1,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 90,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: provider.eventDetail!.schedules.length,
                      itemBuilder: (c, i) {
                        final schedule = provider.eventDetail!.schedules[i];
                        return _itemEventSchedule(
                          schedule: schedule,
                          onLongPress: () {
                            if (provider.eventDetail == null) return;
                            addCalendar(
                              title: provider.eventDetail!.title,
                              description: provider.eventDetail!.description,
                              location: provider.eventDetail!.location,
                              schedule: schedule,
                            );
                          },
                        );
                      },
                      separatorBuilder: (c, i) => const SizedBox(width: 12),
                    ),
                  ),
                ],
              ),
            if (kDebugMode) CardEventSchedule(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  void addCalendar({
    required String title,
    required String description,
    required String location,
    required EventSchedule schedule,
  }) {
    final dateTime = DateTime(
      schedule.eventDate.year,
      schedule.eventDate.month,
      schedule.eventDate.day,
      schedule.startTime.hour,
      schedule.startTime.minute,
    );
    final event = calendar.Event(
      title: title,
      description: description,
      location: location,
      startDate: dateTime,
      endDate: dateTime.add(Duration(hours: 4)),
      iosParams: const calendar.IOSParams(
        reminder: Duration(minutes: 30),
      ),
      androidParams: const calendar.AndroidParams(
        emailInvites: [],
      ),
    );
    calendar.Add2Calendar.addEvent2Cal(event);
  }

  Widget _itemEventSchedule({
    required EventSchedule schedule,
    required VoidCallback onLongPress,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
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
                  schedule.eventDate.format(pattern: "MMM"),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.colorT2,
                  ),
                ),
                Text(
                  schedule.eventDate.format(pattern: "dd"),
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: AppColors.colorT1,
                  ),
                ),
                Text(
                  schedule.startTime.format(pattern: "HH:mm"),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: AppColors.colorT3,
                  ),
                ),
              ],
            ),
          ),
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
