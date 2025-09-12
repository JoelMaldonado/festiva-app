import 'package:festiva/domain/model/event.dart';
import 'package:festiva/presentation/components/card_event.dart';
import 'package:festiva/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CarouselEvents extends StatelessWidget {
  final List<Event> events;
  final Duration autoPlayInterval;
  final Duration slideDuration;
  final Curve slideCurve;

  const CarouselEvents({
    super.key,
    required this.events,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.slideDuration = const Duration(milliseconds: 500),
    this.slideCurve = Curves.easeOut,
  });

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(
          "Events",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: AppColors.colorT1,
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final event = events[index % events.length];
              return CardEvent(event: event);
            },
            itemCount: events.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
          ),
        ),
      ],
    );
  }
}
