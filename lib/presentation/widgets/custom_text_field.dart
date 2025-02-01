import 'package:festiva_flutter/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  const CustomTextField({
    super.key,
    this.controller,
    this.placeholder,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: TextField(
        controller: controller,
        decoration: _decoration(),
        style: AppTextStyles.callout.copyWith(
          color: Colors.white,
        ),
        cursorColor: AppColors.colorT2,
        obscureText: obscureText,
      ),
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.colorB3,
      hintText: placeholder,
      hintStyle: AppTextStyles.callout.copyWith(
        color: AppColors.colorT2,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 24),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide.none,
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }
}
