import 'package:festiva/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isEnabled;
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ElevatedButton(
              onPressed: isEnabled ? onPressed : null,
              child: Text(
                label,
                style: AppTextStyles.headline.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}
