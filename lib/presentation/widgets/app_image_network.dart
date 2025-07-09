import 'package:cached_network_image/cached_network_image.dart';
import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/widgets/custom_shimmer.dart';
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
        : CachedNetworkImage(
            imageUrl: imageUrl!,
            fit: fit,
            width: width,
            height: height,
            placeholder: (context, url) => CustomShimmer(
              width: width,
              height: height,
            ),
            errorWidget: (context, url, error) => _getImageNotFound(),
          );
  }

  Widget _getImageNotFound() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.colorB2,
      ),
      padding: const EdgeInsets.all(24),
      child: Image.asset(
        fallbackAsset,
        fit: fit,
      ),
    );
  }
}
