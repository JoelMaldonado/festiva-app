import 'dart:async';

import 'package:festiva/domain/model/club/club_summary.dart';
import 'package:festiva/presentation/components/card_club.dart';
import 'package:festiva/presentation/pages/club_detail/club_detail_page.dart';
import 'package:flutter/material.dart';

class CarouselClubsComponent extends StatefulWidget {
  final List<ClubSummary> clubs;
  final int durationInSeconds;

  const CarouselClubsComponent({
    super.key,
    required this.clubs,
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
              club: item,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ClubDetailPage(idClub: item.id),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
