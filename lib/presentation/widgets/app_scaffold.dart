import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  const AppScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: child,
        ),
      ),
    );
  }
}
