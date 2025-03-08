import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final bool isLoadingScreen;
  const AppScaffold({
    super.key,
    required this.child,
    this.isLoadingScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoadingScreen
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: child,
              ),
            ),
    );
  }
}
