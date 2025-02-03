import 'package:festiva_flutter/presentation/theme/colors.dart';
import 'package:festiva_flutter/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CardArtist extends StatelessWidget {
  const CardArtist({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    "https://s3-alpha-sig.figma.com/img/385d/1c53/951ba075ed9b335ceca0cf71ab50f69f?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=dVsUlYBhRiKoe~FvSNSK2MWESBRvB6t2h1EBS6aMr6K3pekle8AEZNNYVNkdsbQ7ERFYmfIVmJhuaTwAeSRsiWN13aVtJWybO~YAzkzwli4IjSAU9yNs1VTqQwjlWszGLflzgCVn7G6OLt1zE4zGjNlI8vWD0Mxii5nURHrapRCUYCIRzFKtNPz-lcI2mK4B2k3HshGLpaoyeGfANm4~DQkm2wbntb0y3qyflq-QxNom03rF9Ud1xestmJzfEJ4tiJUUmA-ctWqP9Y~f0-DLx~aTam0vnvbKbvxWSKF-LfXw7QMmM4jTfcRp8SNurysYifvUDLjz1URn6TUEkCuH2Q__",
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
    );
  }
}
