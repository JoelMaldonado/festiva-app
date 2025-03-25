import 'package:festiva_flutter/presentation/pages/preferences/components/item_preferences.dart';
import 'package:festiva_flutter/presentation/theme/colors.dart';
import 'package:festiva_flutter/presentation/theme/text_styles.dart';
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
          ItemPreferences(
            icon: Icons.person_outline,
            title: "Usuario",
          ),
          ItemPreferences(
            icon: Icons.language_outlined,
            title: "Idioma",
          ),
          ItemPreferences(
            icon: Icons.message_outlined,
            title: "Centro de mensajes",
          ),
          ItemPreferences(
            icon: Icons.help_outline,
            title: "Ayuda y soporte",
          ),
          ItemPreferences(
            icon: Icons.star_outline,
            title: "Calificar App",
          ),
          ItemPreferences(
            icon: Icons.book_outlined,
            title: "Términos y condiciones",
          ),
        ],
      ),
    );
  }
}
