import 'dart:async';

import 'package:festiva/domain/model/event.dart';
import 'package:festiva/presentation/components/card_event.dart';
import 'package:flutter/material.dart';

class CarouselEventsComponent extends StatefulWidget {
  final List<Event> eventSchedules;

  const CarouselEventsComponent({
    super.key,
    required this.eventSchedules,
  });

  @override
  State<CarouselEventsComponent> createState() =>
      _CarouselEventsComponentState();
}

class _CarouselEventsComponentState extends State<CarouselEventsComponent> {
  final _scrollController = ScrollController();

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final current = _scrollController.offset;
        final next = current + 200;

        if (next < maxScroll) {
          _scrollController.animateTo(
            next,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 180,
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: widget.eventSchedules.length,
        separatorBuilder: (context, index) => SizedBox(width: 16),
        itemBuilder: (context, index) {
          final item = widget.eventSchedules[index];
          return CardEvent(eventSchedule: item);
        },
      ),
    );
  }
}
