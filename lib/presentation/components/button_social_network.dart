import 'package:festiva/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonSocialNetwork extends StatelessWidget {
  final String code;
  final String url;

  const ButtonSocialNetwork({
    super.key,
    required this.code,
    required this.url,
  });

  String get _getAsset {
    switch (code) {
      case 'facebook':
        return 'assets/images/social_facebook.png';
      case 'instagram':
        return 'assets/images/social_instagram.png';
      case 'snapchat':
        return 'assets/images/social_snapchat.png';
      case 'tiktok':
        return 'assets/images/social_tiktok.png';
      case 'twitter':
        return 'assets/images/social_twitter.png';
      case 'soundcloud':
        return 'assets/images/social_soundcloud.png';
      default:
        return 'assets/app_icon.png';
    }
  }

  void _openLink() async {
    try {
      final uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {}
    } catch (e) {
      print("Error opening link: $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(),
      color: Colors.transparent,
      child: Ink(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.colorB3,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: _openLink,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Image.asset(
              _getAsset,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
