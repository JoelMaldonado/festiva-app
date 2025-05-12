import 'package:festiva_flutter/presentation/pages/preferences/components/item_preferences.dart';
import 'package:festiva_flutter/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Ayuda y soporte',
      child: Column(
        spacing: 16,
        children: [
          ItemPreferences(
            icon: Icons.key_outlined,
            title: "Cambiar Contraseña",
            withArrow: false,
            onTap: () {},
          ),
          ItemPreferences(
            icon: Icons.delete_outline,
            title: "Eliminar Cuenta",
            withArrow: false,
            onTap: () {},
          ),
          ItemPreferences(
            icon: Icons.help_outline,
            title: "Preguntas Frecuentes",
            withArrow: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
