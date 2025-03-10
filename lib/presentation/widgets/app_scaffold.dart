import 'package:festiva_flutter/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final bool isLoadingScreen;
  final String? errorMessage;

  const AppScaffold({
    super.key,
    required this.child,
    this.isLoadingScreen = false,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoadingScreen
          ? _buildloadingScreen()
          : errorMessage != null
              ? _buildErrorScreen()
              : _buildPage(),
    );
  }

  Widget _buildPage() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
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
