import 'dart:io';

import 'package:festiva/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class AppImageNetwork extends StatelessWidget {
  final String? imageUrl;
  final String fallbackAsset;
  final BoxFit fit;
  final double? width;
  final double? height;

  const AppImageNetwork({
    super.key,
    required this.imageUrl,
    this.fallbackAsset = 'assets/images/logo_large.png',
    this.fit = BoxFit.cover,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return imageUrl == null || imageUrl!.trim().isEmpty
        ? _getImageNotFound()
        : Image.network(
            imageUrl!,
            fit: fit,
            width: width,
            height: height,
            errorBuilder: (context, error, stackTrace) => _getImageNotFound(),
          );
  }

  Widget _getImageNotFound() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.colorB2,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          fallbackAsset,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
