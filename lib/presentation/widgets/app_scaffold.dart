import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final CustomAppBar? appBar;
  final bool isLoadingScreen;
  final String? errorMessage;
  final EdgeInsets padding;
  final bool safeArea;

  const AppScaffold({
    super.key,
    required this.child,
    this.appBar,
    this.isLoadingScreen = false,
    this.errorMessage,
    this.padding = const EdgeInsets.only(left: 24, right: 24, top: 16),
    this.safeArea = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: isLoadingScreen
          ? _buildloadingScreen()
          : errorMessage != null
              ? _buildErrorScreen()
              : _buildPage(),
    );
  }

  Widget _buildPage() {
    return SafeArea(
      bottom: safeArea,
      top: safeArea,
      left: safeArea,
      right: safeArea,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }

  Widget _buildloadingScreen() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorScreen() {
    return Center(
      child: Text(
        errorMessage!,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.colorRed,
        ),
      ),
    );
  }
}
