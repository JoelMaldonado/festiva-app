import 'dart:async';

// ignore: unused_import
import 'package:festiva/data/model/response/ui_response.dart';
import 'package:festiva/main.dart';
import 'package:festiva/presentation/components/card_club.dart';
import 'package:festiva/presentation/components/card_club_shimmer.dart';
import 'package:festiva/presentation/pages/club_detail/club_detail_page.dart';
import 'package:festiva/presentation/providers/club_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarouselClubsComponent extends StatefulWidget {
  final int durationInSeconds;

  const CarouselClubsComponent({
    super.key,
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ClubProvider>(context, listen: false).getClubs();
    });
  }

  void _startAutoSlide() {
    final provider = Provider.of<ClubProvider>(context, listen: false);
    _timer = Timer.periodic(
      Duration(seconds: widget.durationInSeconds),
      (timer) {
        if (_pageController.hasClients) {
          final nextPage = _currentPage + 1;
          if (nextPage < provider.listUiClubs.length) {
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
    final provider = Provider.of<ClubProvider>(context);
    if (provider.isLoadingUiClubs) {
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
        itemCount: provider.listUiClubs.length,
        onPageChanged: (index) {
          _currentPage = index;
          final remaining = provider.listUiClubs.length - index;
          if (remaining <= 3) {
            tagito.d("Fetching more clubs, remaining: $remaining");
            provider.getMoreClubs();
          }
        },
        itemBuilder: (context, index) {
          final item = provider.listUiClubs[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CardClub(
              name: item.name,
              coverUrl: item.coverUrl,
              logoUrl: item.logoUrl,
              type: item.type,
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
