import 'package:festiva/presentation/theme/theme.dart';
import 'package:festiva/presentation/widgets/custom_image_network.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselClubCovers extends StatefulWidget {
  final List<String> covers;

  const CarouselClubCovers({super.key, required this.covers});

  @override
  State<CarouselClubCovers> createState() => _CarouselClubCoversState();
}

class _CarouselClubCoversState extends State<CarouselClubCovers> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.covers.length,
            itemBuilder: (c, i) {
              return Padding(
                padding: const EdgeInsets.all(24),
                child: CustomImageNetwork(
                  imageUrl: widget.covers[i],
                  borderRadius: 12,
                  width: double.infinity,
                  height: double.infinity,
                  isExpandable: true,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        SmoothPageIndicator(
          controller: _pageController,
          count: widget.covers.length,
          effect: ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: AppColors.colorP1,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
