import 'package:festiva_flutter/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
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
              onPressed: onPressed,
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
