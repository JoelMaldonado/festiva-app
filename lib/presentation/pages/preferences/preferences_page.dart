import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Preferencias",
                style: AppTextStyles.largeTitle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.colorT1,
                ),
              ),
              Text(
                "Selecciona una opción",
                style: AppTextStyles.callout.copyWith(
                  color: AppColors.colorT2,
                ),
              ),
            ],
          ),
          //ItemPreferences(
          //  icon: Icons.person_outline,
          //  title: "Usuario",
          //  onTap: () {
          //    Navigator.push(
          //      context,
          //      MaterialPageRoute(
          //        builder: (_) => ProfilePage(),
          //      ),
          //    );
          //  },
          //),
          //ItemPreferences(
          //  icon: Icons.language_outlined,
          //  title: "Idioma",
          //  onTap: () {},
          //),
          //ItemPreferences(
          //  icon: Icons.message_outlined,
          //  title: "Centro de mensajes",
          //  onTap: () {},
          //),
          //ItemPreferences(
          //  icon: Icons.help_outline,
          //  title: "Ayuda y soporte",
          //  onTap: () {
          //    Navigator.push(
          //      context,
          //      MaterialPageRoute(
          //        builder: (_) => SupportPage(),
          //      ),
          //    );
          //  },
          //),
          //ItemPreferences(
          //  icon: Icons.star_outline,
          //  title: "Calificar App",
          //  onTap: () {},
          //),
          //ItemPreferences(
          //  icon: Icons.book_outlined,
          //  title: "Términos y condiciones",
          //  onTap: () {},
          //),
        ],
      ),
    );
  }
}
