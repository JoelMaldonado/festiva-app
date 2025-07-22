import 'package:festiva/presentation/providers/artist_provider.dart';
import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/widgets/custom_expandable_text.dart';
import 'package:festiva/presentation/widgets/custom_image_network.dart';
import 'package:festiva/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailArtistPage extends StatefulWidget {
  final int idArtist;
  const DetailArtistPage({
    super.key,
    required this.idArtist,
  });

  @override
  State<DetailArtistPage> createState() => _DetailArtistPageState();
}

class _DetailArtistPageState extends State<DetailArtistPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ArtistProvider>(context, listen: false)
          .getArtist(widget.idArtist);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ArtistProvider>(context);
    return AppScaffold(
      isLoadingScreen: provider.isLoadingArtist,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          spacing: 16,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.colorP1,
                  width: 3,
                ),
              ),
              child: ClipOval(
                child: provider.artist?.urlFoto != null
                    ? Image.network(
                        provider.artist!.urlFoto!,
                        fit: BoxFit.cover,
                      )
                    : SizedBox.shrink(),
              ),
            ),
            Card(
              color: AppColors.colorB4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  spacing: 12,
                  children: [
                    Text(
                      provider.artist?.nombre ?? "Sin Nombre",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.colorT1,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      provider.artist?.tipo ?? "Sin Tipo",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.colorT2,
                      ),
                    ),
                    Text(
                      provider.artist?.descrip ?? "Sin Descripción",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.colorT2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4,
                      children: [
                        _redSocial("assets/images/instagram.png"),
                        _redSocial("assets/images/facebook.png"),
                        _redSocial("assets/images/snapchat.png"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              color: AppColors.colorB4,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Stack(
                      children: [
                        CustomImageNetwork(
                          imageUrl: provider.artist?.urlFoto2,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        Container(
                          constraints: BoxConstraints.expand(),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withValues(alpha: .9),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 12,
                          left: 12,
                          child: Text(
                            "About the Artist",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.colorT1,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: CustomExpandableText(
                      text: provider.artist?.biografia ?? "Sin Biografía",
                      maxLines: 10,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.colorT2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _redSocial(
    String asset,
  ) {
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
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Image.asset(
              asset,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
