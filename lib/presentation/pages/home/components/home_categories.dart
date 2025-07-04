import 'package:festiva/presentation/pages/home/home_provider.dart';
import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).getCatEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Column(
      children: [
        _section(
          title: "Categorías",
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          height: 24,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: provider.eventCategories.length,
            itemBuilder: (context, index) {
              final item = provider.eventCategories[index];
              return _chipCategory(
                text: item.title,
                isSelected: provider.categorySelected == item.id,
                onPressed: () {
                  provider.setCategorySelected(item.id);
                },
              );
            },
            separatorBuilder: (_, __) => const SizedBox(width: 8),
          ),
        ),
      ],
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
}
