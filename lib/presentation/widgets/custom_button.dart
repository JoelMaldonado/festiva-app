import 'package:festiva_flutter/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: ElevatedButton(
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
