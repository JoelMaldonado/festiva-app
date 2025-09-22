import 'package:festiva/presentation/pages/preferences/components/item_preferences.dart';
import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/theme/text_styles.dart';
import 'package:festiva/widget_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

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
                "Preferences",
                style: AppTextStyles.largeTitle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.colorT1,
                ),
              ),
              Text(
                "Select an option",
                style: AppTextStyles.callout.copyWith(
                  color: AppColors.colorT2,
                ),
              ),
            ],
          ),
          /*
          ItemPreferences(
            icon: Icons.person_outline,
            title: "Profile",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProfilePage(),
                ),
              );
            },
          ),
          ItemPreferences(
            icon: Icons.login,
            title: "Sign In 1",
            onTap: () {
              GoRouter.of(context).push('/uno');
            },
          ),
          ItemPreferences(
            icon: Icons.login,
            title: "Sign In 2",
            onTap: () {
              GoRouter.of(context).push('/dos');
            },
          ),
          */
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

          ItemPreferences(
            icon: Icons.widgets_outlined,
            title: "Push Event to Widget",
            onTap: () async {
              await pushEventToWidget(
                title: 'Hø.  Festival',
                dateText: 'Lun 23 Sep • 12:00',
                imageDrawableName: 'event_placeholder',
              );
            },
          ),

          ItemPreferences(
            icon: Icons.book_outlined,
            title: "Privacy Policy",
            onTap: () => _openLink(dotenv.env['POLICY_URL']!),
          ),
        ],
      ),
    );
  }

  void _openLink(String url) async {
    try {
      final uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {}
    } catch (e) {
      Fluttertoast.showToast(msg: "Error opening link: $url");
    }
  }
}
