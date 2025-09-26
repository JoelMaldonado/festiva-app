import 'dart:async';

import 'package:festiva/domain/model/event.dart';
import 'package:festiva/presentation/components/card_event.dart';
import 'package:festiva/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CarouselEvents extends StatefulWidget {
  final List<Event> events;
  final Duration autoPlayInterval;
  final Duration slideDuration;
  final Curve slideCurve;

  final double itemWidth;

  const CarouselEvents({
    super.key,
    required this.events,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.slideDuration = const Duration(milliseconds: 500),
    this.slideCurve = Curves.easeOut,
    this.itemWidth = 180,
  });

  @override
  State<CarouselEvents> createState() => _CarouselEventsState();
}

class _CarouselEventsState extends State<CarouselEvents> {
  final _separatorWidth = 12.0;
  final _listHeight = 180.0;
  late final ScrollController _controller;
  Timer? _timer;

  double get _step => widget.itemWidth + _separatorWidth;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(widget.autoPlayInterval, (_) => _tick());
  }

  void _tick() {
    if (!_controller.hasClients) return;

    final position = _controller.position;
    // Si el contenido no supera el viewport, no hay nada que scrollear.
    if (!position.hasContentDimensions || position.maxScrollExtent <= 0) return;

    final current = position.pixels;
    final max = position.maxScrollExtent;

    // Si estamos cerca del final, reiniciamos a 0 (sin animación para evitar "rebote")
    if (current + _step >= max) {
      // Opcional: animar al final antes de reiniciar
      // await _controller.animateTo(max, duration: widget.slideDuration, curve: widget.slideCurve);
      _controller.jumpTo(0);
      // Avanza un paso desde el inicio para que se note el movimiento en el próximo tick (opcional)
      _controller.animateTo(
        _step.clamp(0, max),
        duration: widget.slideDuration,
        curve: widget.slideCurve,
      );
      return;
    }

    // Avanzamos un "paso" normal
    _controller.animateTo(
      (current + _step).clamp(0, max),
      duration: widget.slideDuration,
      curve: widget.slideCurve,
    );
  }

  @override
  void didUpdateWidget(covariant CarouselEvents oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reinicia el timer si cambian intervalos o la lista
    if (oldWidget.autoPlayInterval != widget.autoPlayInterval ||
        oldWidget.events.length != widget.events.length) {
      _startAutoScroll();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final events = widget.events;
    if (events.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Text(
            "Events",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: AppColors.colorT1,
            ),
          ),
        ),
        SizedBox(
          height: _listHeight,
          child: ListView.separated(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: events.length,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final event = events[index];
              // Sugerencia: Si tu CardEvent no tiene ancho fijo, envuélvelo
              // en SizedBox para que el scroll "paso a paso" sea consistente.
              return SizedBox(
                width: widget.itemWidth,
                child: CardEvent(event: event),
              );
            },
          ),
        ),
      ],
    );
  }
}
