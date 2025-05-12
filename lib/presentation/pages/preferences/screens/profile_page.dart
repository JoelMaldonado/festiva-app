import 'package:festiva_flutter/presentation/theme/colors.dart';
import 'package:festiva_flutter/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Usuario',
      child: Column(
        spacing: 16,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.colorP1,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                'https://www.seekpng.com/png/detail/57-576498_man-face-png-happy-people-face-png.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          AppButton(
            label: "Jorge Palma",
            onPressed: () {},
            isEnabled: false,
          ),
        ],
      ),
    );
  }
}
