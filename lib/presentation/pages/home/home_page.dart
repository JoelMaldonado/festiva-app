import 'package:festiva_flutter/presentation/components/card_artist.dart';
import 'package:festiva_flutter/presentation/components/card_club.dart';
import 'package:festiva_flutter/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 16,
      ),
      child: Column(
        children: [
          _section(
            title: "Categorías",
          ),
          _section(
            title: "Clubs",
            onPressed: () {},
          ),
          CardClub(),
          _section(
            title: "Eventos",
            onPressed: () {},
          ),
          SizedBox(
            width: double.infinity,
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              separatorBuilder: (context, index) => SizedBox(width: 16),
              itemBuilder: (context, index) {
                return CardArtist();
              },
            ),
          ),
          _section(
            title: "Artistas",
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Row _section({
    required String title,
    VoidCallback? onPressed,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.headline.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.colorT1,
            ),
          ),
        ),
        onPressed == null
            ? SizedBox.shrink()
            : TextButton(
                onPressed: onPressed,
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.colorT2,
                  textStyle: AppTextStyles.footnote,
                ),
                child: Text("Ver más"),
              ),
      ],
    );
  }
}
