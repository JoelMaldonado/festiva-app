import 'dart:async';
import 'package:festiva/data/model/response/ui_response.dart';
import 'package:festiva/presentation/components/card_club.dart';
import 'package:festiva/presentation/components/card_club_shimmer.dart';
import 'package:flutter/material.dart';

class CarouselClubsComponent extends StatefulWidget {
  final List<UiClub> clubs;
  final bool isLoading;
  final int durationInSeconds;

  const CarouselClubsComponent({
    super.key,
    required this.clubs,
    required this.isLoading,
    required this.durationInSeconds,
  });

  @override
  State<CarouselClubsComponent> createState() => _CarouselClubsComponentState();
}

class _CarouselClubsComponentState extends State<CarouselClubsComponent> {
  final _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(
      Duration(seconds: widget.durationInSeconds),
      (timer) {
        if (_pageController.hasClients) {
          final nextPage = _currentPage + 1;
          if (nextPage < widget.clubs.length) {
            _currentPage = nextPage;
          } else {
            _currentPage = 0;
          }
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CardClubShimmer(),
      );
    }
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.clubs.length,
        onPageChanged: (index) => _currentPage = index,
        itemBuilder: (context, index) {
          final item = widget.clubs[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CardClub(
              id: item.id,
              name: item.name,
              coverUrl: item.coverUrl,
              logoUrl: item.logoUrl,
              address: item.address,
              isOpen: item.isOpen,
            ),
          );
        },
      ),
    );
  }
}
