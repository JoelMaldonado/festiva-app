import 'package:festiva_flutter/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class CardArtist extends StatelessWidget {
  const CardArtist({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              "https://s3-alpha-sig.figma.com/img/1ffb/191e/1f1237f9b91d2797285dded335b7e95e?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=ZZKY3POL6Z6EkjeGtvb5t6bmVfQ7E-zp8eqZfK5DGUFqCrS89l-n9R6wYY4dHqFmGmJanOqPXCqwiVVvg3EXgwAfzgJ0DygOitGlxEJ3dC2xFkDfO9fpAKnBL-bdcNfq7Zr0hv0~IZkuUZ4c4SzcZcyF66to3sZU3Nn7pm2OQSTdblIfG8PMhW3U-DkslRcsnRTX0hvs2X2Ygk0Cl0qZ1gjKi9qwwzgaFv15ee7VOl1wiQISCqdH~yQi~IBkGtoU5muv1oOwrQmlQZHKEhlmYHh5l93Oqg9nqdQq7D-24O7x7TKZXbpasv05EJ3am4~QyODIjhM3bBex9LzeVqCPNw__",
              width: 72,
              height: 72,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Planetshakers",
            style: AppTextStyles.caption2,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
