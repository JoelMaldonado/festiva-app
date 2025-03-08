import 'package:festiva_flutter/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class CardClub extends StatelessWidget {
  final VoidCallback onPressed;
  const CardClub({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        width: double.infinity,
        height: 220,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          splashColor: Colors.white.withValues(alpha: .2),
          highlightColor: Colors.white.withValues(alpha: .1),
          child: Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.colorB4,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: Image.network(
                        "https://www.infobae.com/resizer/v2/UMAXX7NK7NCKPOC22TCFTGRRAA.jpg?auth=f1aabba022d02dd8671969c31bcebf474d220664c364366fcd44d7a3038464b6&smart=true&width=350&height=467&quality=85",
                        width: double.infinity,
                        height: 140,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.colorGreen,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 2,
                        ),
                        child: Text("Abierto"),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Image.network(
                        "https://www.infobae.com/resizer/v2/UMAXX7NK7NCKPOC22TCFTGRRAA.jpg?auth=f1aabba022d02dd8671969c31bcebf474d220664c364366fcd44d7a3038464b6&smart=true&width=350&height=467&quality=85",
                        width: 36,
                        height: 36,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ibiza Club Lounge",
                            style: AppTextStyles.callout.copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.colorT1,
                            ),
                          ),
                          Text(
                            "Discoteca",
                            style: AppTextStyles.footnote.copyWith(
                              color: AppColors.colorT2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
