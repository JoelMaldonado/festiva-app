import 'package:festiva/main.dart';
import 'package:festiva/presentation/providers/club_provider.dart';
import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/widgets/custom_floating_action_button.dart';
import 'package:festiva/presentation/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ClubDetailPage extends StatefulWidget {
  final int idClub;

  const ClubDetailPage({
    super.key,
    required this.idClub,
  });

  @override
  State<ClubDetailPage> createState() => _ClubDetailPageState();
}

class _ClubDetailPageState extends State<ClubDetailPage> {
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
      padding: EdgeInsets.zero,
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
                      AspectRatio(
                        aspectRatio: 1,
                        child: PageView.builder(
                          itemCount: club.covers.length,
                          itemBuilder: (c, i) {
                            return Padding(
                              padding: const EdgeInsets.all(24),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  club.covers[i],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        left: 40,
                        bottom: 40,
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: AppImageNetwork(
                              imageUrl: club.logoUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
                      children: [
                        Row(
                          spacing: 12,
                          children: [
                            Expanded(
                              child: Text(
                                club.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.colorT1,
                                ),
                              ),
                            ),
                            //AppFloatingActionButton(
                            //  onPressed: () {},
                            //  icon: Icons.favorite_outline,
                            //),
                            //AppFloatingActionButton(
                            //  onPressed: () {},
                            //  icon: Icons.share_outlined,
                            //),
                          ],
                        ),
                        Text(
                          club.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.colorT2,
                          ),
                        ),
                        //_itemDetail(
                        //  icon: Icons.calendar_month,
                        //  title: "Opening Hours",
                        //  value: "Monday - Saturdar 8:00 - 22:00",
                        //  onTap: () {
                        //    Navigator.push(context,
                        //        MaterialPageRoute(builder: (_) {
                        //      return ClubSchedulePage(
                        //        schedules: club.schedules,
                        //      );
                        //    }));
                        //  },
                        //),
                        //_itemDetail(
                        //  icon: Icons.explore_outlined,
                        //  title: "Address",
                        //  value: club.address.firstOrNull?.address ?? '',
                        //),
                        //Row(
                        //  spacing: 12,
                        //  children: [
                        //    Expanded(
                        //      flex: 2,
                        //      child: _itemDetail(
                        //        icon: Icons.star_outline,
                        //        title: "Rating",
                        //        value: "5.0",
                        //      ),
                        //    ),
                        //    CustomFloatingActionButton(
                        //      icon: Icons.mail_outline,
                        //      backgroundColor: AppColors.colorBlue,
                        //      onPressed: () {},
                        //    ),
                        //    CustomFloatingActionButton(
                        //      icon: Icons.call_outlined,
                        //      backgroundColor: AppColors.colorGreen,
                        //      onPressed: () {},
                        //    ),
                        //  ],
                        //),

                        Text(
                          "Social Networks",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: AppColors.colorT1,
                          ),
                        ),

                        SizedBox(
                          height: 42,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: club.socialNetworks.length,
                            itemBuilder: (c, i) {
                              final socialNetwork = club.socialNetworks[i];
                              return Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () => _openLink(socialNetwork.url),
                                  customBorder: CircleBorder(),
                                  child: Ink(
                                    width: 42,
                                    height: 42,
                                    decoration: BoxDecoration(
                                      color: AppColors.colorB3,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: AppImageNetwork(
                                        imageUrl: socialNetwork.logoUrl,
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (c, i) =>
                                const SizedBox(width: 8),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
    );
  }

  void _openLink(String url) async {
    try {
      final uri = Uri.parse(url);
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        tagito.e("Could not launch $url");
      }
    } catch (e) {
      tagito.e("Error opening link: $url");
    }
  }

  Widget _itemDetail({
    required IconData icon,
    required String title,
    required String value,
    VoidCallback? onTap,
  }) {
    return Ink(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.colorB3,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(8),
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
        ),
      ),
    );
  }
}
