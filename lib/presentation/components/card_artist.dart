import 'package:festiva_flutter/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CardArtist extends StatelessWidget {
  const CardArtist({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              "https://www.infobae.com/resizer/v2/UMAXX7NK7NCKPOC22TCFTGRRAA.jpg?auth=f1aabba022d02dd8671969c31bcebf474d220664c364366fcd44d7a3038464b6&smart=true&width=350&height=467&quality=85",
              width: 72,
              height: 72,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Planetshakers",
            style: AppTextStyles.caption2,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
