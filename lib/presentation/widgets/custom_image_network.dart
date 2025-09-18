import 'package:festiva/app/router.dart';
import 'package:festiva/presentation/widgets/app_image_network.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomImageNetwork extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;
  final bool isExpandable;

  const CustomImageNetwork({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = 12.0,
    this.isExpandable = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: InkWell(
              onTap: isExpandable && imageUrl != null
                  ? () {
                      GoRouter.of(context).push(
                        AppRoutes.fullScreenImage,
                        extra: imageUrl,
                      );
                    }
                  : null,
              borderRadius: BorderRadius.circular(borderRadius),
              child: AppImageNetwork(
                imageUrl: imageUrl,
                width: width,
                height: height,
                fit: fit,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
