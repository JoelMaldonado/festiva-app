import 'package:festiva_flutter/presentation/theme/colors.dart';
import 'package:festiva_flutter/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailEventPage extends StatelessWidget {
  const DetailEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        spacing: 12,
        children: [
          Material(
            elevation: 12,
            borderRadius: BorderRadius.circular(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: double.infinity,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/rock-music-concert-event-party-flyer-band-ad-design-template-16331aba58f75b588a4e2bbed9ba3e95_screen.jpg?ts=1735311639",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: Text(
                  "Sábado de Rock",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: AppColors.colorT1,
                  ),
                ),
              ),
              CustomFloatingActionButton(
                onPressed: () {},
                icon: Icons.favorite_outline,
              ),
              CustomFloatingActionButton(
                onPressed: () {},
                icon: Icons.share_outlined,
              ),
            ],
          ),
          Text(
            "¡Rock en Vivo este sábado! 🎸🤘 Ven y disfruta de la mejor música en nuestro evento. ¡Te esperamos! #SábadoDeRock 🎶🔥",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.colorT2,
            ),
          ),
          Row(
            spacing: 12,
            children: [
              Expanded(
                flex: 1,
                child: _itemDetail(
                  icon: Icons.calendar_month_outlined,
                  title: "Fecha",
                  value: "13/06/2025",
                ),
              ),
              Expanded(
                flex: 2,
                child: _itemDetail(
                  icon: Icons.schedule_outlined,
                  title: "Horario",
                  value: "09:00 pm. - 12:00 pm.",
                ),
              ),
            ],
          ),
          _itemDetail(
            icon: Icons.explore_outlined,
            title: "Ubicación",
            value: "Av. Los Pinos 123, Lima, Perú",
          ),
          Row(
            spacing: 12,
            children: [
              Expanded(
                flex: 2,
                child: _itemDetail(
                  icon: Icons.calendar_month_outlined,
                  title: "Fecha",
                  value: "13/06/2025",
                ),
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: AppColors.colorBlue,
                foregroundColor: AppColors.colorT1,
                shape: CircleBorder(),
                child: Icon(Icons.message_outlined),
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: AppColors.colorGreen,
                foregroundColor: AppColors.colorT1,
                shape: CircleBorder(),
                child: Icon(Icons.workspace_premium),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _itemDetail({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.colorB3,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 20,
                color: AppColors.colorT1,
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    color: AppColors.colorT1,
                  ),
                ),
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.colorT2,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
