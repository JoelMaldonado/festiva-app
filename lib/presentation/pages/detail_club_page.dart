import 'package:festiva_flutter/presentation/providers/club_provider.dart';
import 'package:festiva_flutter/presentation/theme/colors.dart';
import 'package:festiva_flutter/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailClubPage extends StatefulWidget {
  final int idClub;

  const DetailClubPage({
    super.key,
    required this.idClub,
  });

  @override
  State<DetailClubPage> createState() => _DetailClubPageState();
}

class _DetailClubPageState extends State<DetailClubPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ClubProvider>(context, listen: false).getClub(
        widget.idClub,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ClubProvider>(context);
    final club = provider.club;
    return AppScaffold(
      isLoadingScreen: provider.isLoadingClub,
      errorMessage: provider.errorMessage,
      child: club == null
          ? Center(
              child: Text("No se encontro el club"),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                spacing: 16,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              club.urlPortada,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        bottom: 16,
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              club.urlLogo,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        child: Text(
                          club.nombre,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: AppColors.colorT1,
                          ),
                        ),
                      ),
                      AppFloatingActionButton(
                        onPressed: () {},
                        icon: Icons.favorite_outline,
                      ),
                      AppFloatingActionButton(
                        onPressed: () {},
                        icon: Icons.share_outlined,
                      ),
                    ],
                  ),
                  Text(
                    club.descrip,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.colorT2,
                    ),
                  ),
                  _itemDetail(
                    icon: Icons.calendar_month,
                    title: "Horario de Atención",
                    value: "Lunes - Sábado 8:00 - 22:00",
                  ),
                  _itemDetail(
                    icon: Icons.explore_outlined,
                    title: "Ubicación",
                    value: club.direc,
                  ),
                  Row(
                    spacing: 12,
                    children: [
                      Expanded(
                        flex: 2,
                        child: _itemDetail(
                          icon: Icons.star_outline,
                          title: "Calificación",
                          value: "5.0",
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
