import 'package:festiva/presentation/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';

class CardArtistShimmer extends StatelessWidget {
  const CardArtistShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      children: [
        CustomShimmer(
          width: 72,
          height: 72,
          borderRadius: 12,
        ),
        CustomShimmer(
          width: 50,
          height: 12,
        ),
      ],
    );
  }
}
