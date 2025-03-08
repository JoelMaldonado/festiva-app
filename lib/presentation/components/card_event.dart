import 'package:festiva_flutter/presentation/pages/detail_event/detail_event_page.dart';
import 'package:festiva_flutter/presentation/theme/colors.dart';
import 'package:festiva_flutter/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CardEvent extends StatelessWidget {
  const CardEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailEventPage(),
          ),
        );
      },
      child: Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          color: AppColors.colorB4,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.network(
                      "https://www.infobae.com/resizer/v2/UMAXX7NK7NCKPOC22TCFTGRRAA.jpg?auth=f1aabba022d02dd8671969c31bcebf474d220664c364366fcd44d7a3038464b6&smart=true&width=350&height=467&quality=85",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                      left: 8,
                      top: 8,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.colorB3,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: AppColors.colorT1,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "MAR",
                              style: AppTextStyles.caption1,
                            ),
                            Text(
                              "12",
                              style: AppTextStyles.title3.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )),
                  Positioned(
                    left: 8,
                    bottom: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.colorB3,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: AppColors.colorP1,
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 2,
                      ),
                      child: Text(
                        "Concert",
                        style: AppTextStyles.caption1,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Latin Fest - Lima",
                    style: AppTextStyles.footnote.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.colorT1,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: AppColors.colorT2,
                        size: 14,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Ibiza Discoteca",
                        style: AppTextStyles.caption2.copyWith(
                          color: AppColors.colorT2,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
