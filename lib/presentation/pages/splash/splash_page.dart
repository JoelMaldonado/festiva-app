import 'dart:async';

import 'package:festiva/app/router.dart';
import 'package:festiva/core/di/di.dart';
import 'package:festiva/core/storage/prefs.dart';
import 'package:festiva/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));
      final prefs = getIt<Prefs>();
      final route =
          prefs.getOnboarding() ? AppRoutes.menu : AppRoutes.onBoarding;
      if (!mounted) return;
      GoRouter.of(context).pushReplacement(route);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: EdgeInsets.zero,
      safeArea: false,
      child: Stack(
        children: [
          Image.asset(
            "assets/images/splash_background.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          FadeTransition(
            opacity: _animation,
            child: ScaleTransition(
              scale: _animation,
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Center(
                  child: Image.asset(
                    "assets/images/logo_large.png",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
