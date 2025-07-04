import 'package:festiva/presentation/pages/search/search_page.dart';
import 'package:festiva/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: AppColors.colorB3,
          borderRadius: BorderRadius.circular(50),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchPage(),
              ),
            );
          },
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: double.infinity,
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              spacing: 8,
              children: [
                Icon(
                  Icons.search,
                  color: AppColors.colorT2,
                  size: 20,
                ),
                Text(
                  "Search",
                  style: AppTextStyles.subhead.copyWith(
                    color: AppColors.colorT2,
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
