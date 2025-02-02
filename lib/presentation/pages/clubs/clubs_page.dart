import 'package:festiva_flutter/presentation/components/components.dart';
import 'package:festiva_flutter/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class ClubsPage extends StatelessWidget {
  const ClubsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Discotecas",
                      style: AppTextStyles.largeTitle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.colorT1,
                      ),
                    ),
                    Text(
                      "Más cerca de ti",
                      style: AppTextStyles.callout.copyWith(
                        color: AppColors.colorT2,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.colorB3,
                ),
                icon: Icon(
                  Icons.logout,
                  color: AppColors.colorT1,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CardClub(),
                  const SizedBox(height: 16),
                  CardClub(),
                  const SizedBox(height: 16),
                  CardClub(),
                  const SizedBox(height: 16),
                  CardClub(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
