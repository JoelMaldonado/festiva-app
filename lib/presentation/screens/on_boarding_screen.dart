import 'package:festiva_flutter/core/storage/prefs.dart';
import 'package:festiva_flutter/core/di/di.dart';
import 'package:festiva_flutter/presentation/theme/theme.dart';
import 'package:festiva_flutter/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
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
                              child: Text("Siguiente"),
                            ),
                          )
                        : AppButton(
                            label: "Continuar",
                            onPressed: () {
                              _saveOnBoarding();
                              Navigator.pushReplacementNamed(context, '/login');
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

  void _saveOnBoarding() {
    final prefs = getIt<Prefs>();
    save(prefs);
  }

  Future<void> save(Prefs prefs) async {
    await prefs.saveOnboarding(true);
  }

  String _getTitle() {
    switch (_currentPage) {
      case 0:
        return "EVENTOS CERCA DE TI";
      case 1:
        return "UBICA FÁCILMENTE LA DIVERSIÓN ";
      case 2:
        return "GUARDA TUS FAVORITOS";
      default:
        return "";
    }
  }

  String _getDetail() {
    switch (_currentPage) {
      case 0:
        return "Descubre los mejores eventos cerca de ti, con la información precisa de horario y ubicación para que disfrutes cualquier día de la semana. Actualizamos para ti, cada día, los próximos eventos que te pueden gustar.";
      case 1:
        return "Ubica los mejores lugares para divertirte cerca de ti, encuentra discotecas y otros lugares de esparcimiento para disfrutar de planes y eventos realizados exclusivamente para ti.";
      case 2:
        return "Conoce más sobre los lugares que visitaste, deja tu feedback y convierte algunos espacios en tus favoritos, de la misma forma selecciona tus eventos favoritos y mantente al tanto de todo!";
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
