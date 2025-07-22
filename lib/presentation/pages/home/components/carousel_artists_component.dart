import 'dart:async';

import 'package:festiva/domain/model/artist.dart';
import 'package:festiva/presentation/components/card_artist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CarouselArtistsComponent extends StatefulWidget {
  final List<Artist> artists;

  const CarouselArtistsComponent({
    super.key,
    required this.artists,
  });

  @override
  State<CarouselArtistsComponent> createState() =>
      _CarouselArtistsComponentState();
}

class _CarouselArtistsComponentState extends State<CarouselArtistsComponent> {
  final ScrollController _scrollController = ScrollController();
  late List<Artist> _loopedArtists;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _loopedArtists = [...widget.artists, ...widget.artists, ...widget.artists];
    WidgetsBinding.instance.addPostFrameCallback((_) => _startAutoScroll());
  }

  void _startAutoScroll() {
    const tick = Duration(milliseconds: 20); // ~60 FPS
    const distance = 1.0;

    _timer?.cancel(); // Evitar timers duplicados

    _timer = Timer.periodic(tick, (_) {
      if (_scrollController.hasClients) {
        final max = _scrollController.position.maxScrollExtent;
        final current = _scrollController.offset;

        if (current + distance >= max) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.jumpTo(current + distance);
        }
      }
    });
  }

  void _stopAutoScroll() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _stopAutoScroll();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is UserScrollNotification) {
            final direction = notification.direction;
            if (direction != ScrollDirection.idle) {
              _stopAutoScroll();
            } else {
              _startAutoScroll();
            }
          }
          return true;
        },
        child: ListView.separated(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: _loopedArtists.length,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          separatorBuilder: (_, __) => const SizedBox(width: 16),
          itemBuilder: (context, index) {
            final item = _loopedArtists[index % widget.artists.length];
            return CardArtist(artist: item);
          },
        ),
      ),
    );
  }
}
