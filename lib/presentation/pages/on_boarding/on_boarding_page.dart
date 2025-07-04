import 'package:festiva/app/router.dart';
import 'package:festiva/core/storage/prefs.dart';
import 'package:festiva/core/di/di.dart';
import 'package:festiva/presentation/theme/theme.dart';
import 'package:festiva/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<String> images = [
    "assets/images/onboarding1.png",
    "assets/images/onboarding2.png",
    "assets/images/onboarding3.png",
  ];

  void _nextPage() {
    if (_currentPage < images.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void toLogin() {
    GoRouter.of(context).pushReplacement(AppRoutes.menu);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorB1,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 48),
            _sliderImages(),
            const SizedBox(height: 24),
            _indicators(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Text(
                      _getTitle(),
                      style: AppTextStyles.title3.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.colorT1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      _getDetail(),
                      style: AppTextStyles.footnote.copyWith(
                        color: AppColors.colorT2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    _currentPage < images.length - 1
                        ? SizedBox(
                            width: double.infinity,
                            height: 42,
                            child: OutlinedButton(
                              onPressed: _nextPage,
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: AppColors.colorP1),
                                foregroundColor: AppColors.colorP1,
                                textStyle: AppTextStyles.headline,
                              ),
                              child: Text("Next"),
                            ),
                          )
                        : AppButton(
                            label: "Get Started",
                            onPressed: () async {
                              await _save();
                              toLogin();
                            },
                          )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _save() async {
    final prefs = getIt<Prefs>();
    await prefs.saveOnboarding(true);
  }

  String _getTitle() {
    switch (_currentPage) {
      case 0:
        return "EVENTS NEAR YOU";
      case 1:
        return "FIND FUN SPOTS EASILY";
      case 2:
        return "SAVE YOUR FAVORITES";
      default:
        return "";
    }
  }

  String _getDetail() {
    switch (_currentPage) {
      case 0:
        return "Discover the best events happening near you, with up-to-date details on schedules and locations so you can enjoy any day of the week. We keep you in the loop with new events you’ll love, every day.";
      case 1:
        return "Find the hottest places to have fun nearby — clubs, bars, and other great spots with special events just for you. Plan your night out easily.";
      case 2:
        return "Keep track of the places you’ve visited, share your feedback, and save your favorite spots. Pick your favorite events too and never miss out on what’s happening!";
      default:
        return "";
    }
  }

  Row _indicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(images.length, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                _currentPage == index ? AppColors.colorP1 : AppColors.colorB4,
          ),
        );
      }),
    );
  }

  SizedBox _sliderImages() {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        onPageChanged: (value) {
          setState(() {
            _currentPage = value;
          });
        },
        itemBuilder: (context, index) {
          return Image.asset(
            images[index],
          );
        },
      ),
    );
  }
}
