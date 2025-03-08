import 'package:festiva_flutter/presentation/theme/colors.dart';
import 'package:festiva_flutter/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailArtistPage extends StatelessWidget {
  const DetailArtistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
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
                child: Image.network(
                  "https://s2.abcstatics.com/abc/www/multimedia/gente/2024/01/17/ariana-grande-kVxG-U601140978351bzB-1200x840@abc.jpg",
                  fit: BoxFit.cover,
                ),
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
                      "Ariana Grande",
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.colorT1,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "Cantante",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.colorT2,
                      ),
                    ),
                    Text(
                      "Cantante, compositora y actriz estadounidense, estilo único y su impacto en la cultura pop 🎸🤘",
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
                        Image.network(
                          "https://img2.rtve.es/i/?w=1600&i=1625047846393.jpg",
                          fit: BoxFit.cover,
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
                            "Acerca del artista",
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
                    child: Text(
                      "Ariana Grande, nacida el 26 de junio de 1993 en Boca Ratón, Florida, es una cantante, actriz y compositora estadounidense. Comenzó su carrera en el mundo del espectáculo en Broadway, interpretando el papel de Charlotte en la obra musical 13 en 2008",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.colorT2,
                      ),
                    ),
                  )
                ],
              ),
            )
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
