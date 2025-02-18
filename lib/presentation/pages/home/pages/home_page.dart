import 'package:festiva_flutter/presentation/components/card_artist.dart';
import 'package:festiva_flutter/presentation/components/components.dart';
import 'package:festiva_flutter/presentation/pages/home/components/home_button_search.dart';
import 'package:festiva_flutter/presentation/pages/home/providers/home_provider.dart';
import 'package:festiva_flutter/presentation/pages/home/pages/home_search_page.dart';
import 'package:festiva_flutter/presentation/theme/theme.dart';
import 'package:festiva_flutter/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
      ),
      child: Column(
        children: [
          _top(),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  HomeButtonSearch(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeSearchPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _section(
                    title: "Categorías",
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _chipCategory(
                        text: "Todas",
                        isSelected: provider.categorySelected == 0,
                        onPressed: () {
                          provider.setCategorySelected(0);
                        },
                      ),
                      const SizedBox(width: 8),
                      _chipCategory(
                        text: "Conciertos",
                        isSelected: provider.categorySelected == 1,
                        onPressed: () {
                          provider.setCategorySelected(1);
                        },
                      ),
                      const SizedBox(width: 8),
                      _chipCategory(
                        text: "Festivales",
                        isSelected: provider.categorySelected == 2,
                        onPressed: () {
                          provider.setCategorySelected(2);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _section(
                    title: "Clubs",
                    onPressed: () {},
                  ),
                  CardClub(),
                  const SizedBox(height: 16),
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
                      itemBuilder: (context, index) => CardEvent(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _section(
                    title: "Artistas",
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      separatorBuilder: (context, index) => SizedBox(width: 16),
                      itemBuilder: (context, index) => CardArtist(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _top() {
    return Row(
      spacing: 12,
      children: [
        Expanded(
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/logo_large.png",
                width: 140,
                fit: BoxFit.fitWidth,
              ),
              Text(
                "¿A dónde iremos hoy?",
                style: AppTextStyles.callout.copyWith(
                  color: AppColors.colorT2,
                ),
              )
            ],
          ),
        ),
        CustomFloatingActionButton(
          onPressed: () {},
          icon: Icons.logout,
        ),
      ],
    );
  }

  Widget _chipCategory({
    required String text,
    required bool isSelected,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 24,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 16),
          textStyle: AppTextStyles.caption1,
          foregroundColor: AppColors.colorT1,
          side: BorderSide(
            color: isSelected ? AppColors.colorP1 : AppColors.colorT2,
            width: 1,
          ),
        ),
        child: Text(text),
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
