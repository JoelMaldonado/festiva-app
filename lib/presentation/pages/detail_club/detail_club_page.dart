import 'package:festiva/presentation/components/button_social_network.dart';
import 'package:festiva/presentation/components/item_detail.dart';
import 'package:festiva/presentation/pages/detail_club/components/carousel_events.dart';
import 'package:festiva/presentation/pages/club_schedule/club_schedule_page.dart';
import 'package:festiva/presentation/providers/club_provider.dart';
import 'package:festiva/presentation/theme/colors.dart';
import 'package:festiva/presentation/widgets/custom_expandable_text.dart';
import 'package:festiva/presentation/widgets/custom_icon_button.dart';
import 'package:festiva/presentation/widgets/custom_image_network.dart';
import 'package:festiva/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ClubProvider>(context, listen: false).getClub(widget.idClub);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, top: 12, right: 24),
                    child: SizedBox(
                      width: double.infinity,
                      height: 42,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomIconButton(
                              icon: Icons.arrow_back,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              club.name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: AppColors.colorT1,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          AppFloatingActionButton(
                            onPressed: () {},
                            icon: Icons.share_outlined,
                          ),
                        ],
                      ),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 1,
                    child: Stack(
                      children: [
                        PageView.builder(
                          controller: _pageController,
                          itemCount: club.covers.length,
                          itemBuilder: (c, i) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 24,
                                right: 24,
                                bottom: 24,
                                top: 12,
                              ),
                              child: CustomImageNetwork(
                                imageUrl: club.covers[i],
                                borderRadius: 12,
                                width: double.infinity,
                                height: double.infinity,
                                isExpandable: true,
                              ),
                            );
                          },
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
                  ),
                  if (club.covers.length > 1)
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: club.covers.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        activeDotColor: AppColors.colorP1,
                        dotColor: AppColors.colorT2,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
                      children: [
                        /*
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
                        */
                        CustomExpandableText(text: club.description),
                        Row(
                          spacing: 12,
                          children: [
                            Expanded(
                              child: ItemDetail(
                                icon: Icons.calendar_month,
                                title: "Opening Hours",
                                value: "See Schedule",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return ClubSchedulePage(
                                          clubId: widget.idClub,
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                            //AppFloatingActionButton(
                            //  onPressed: () {},
                            //  icon: Icons.share_outlined,
                            //),
                          ],
                        ),
                        Row(
                          spacing: 12,
                          children: [
                            if (club.address != null)
                              Expanded(
                                child: ItemDetail(
                                  icon: Icons.location_pin,
                                  title: "Address",
                                  value: club.address!,
                                  onLongPress: () {
                                    Fluttertoast.showToast(
                                      msg: "Text copied to clipboard",
                                    );
                                    Clipboard.setData(
                                      ClipboardData(text: club.address!),
                                    );
                                  },
                                ),
                              ),
                            if (club.googleRating != null &&
                                club.googleUserRatingsTotal != null)
                              Expanded(
                                child: ItemDetail(
                                  icon: Icons.star,
                                  title:
                                      "Rating (${club.googleUserRatingsTotal})",
                                  child: Row(
                                    spacing: 4,
                                    children: [
                                      Text("${club.googleRating}"),
                                      RatingBarIndicator(
                                        rating: club.googleRating!,
                                        itemBuilder: (context, index) {
                                          return Icon(
                                            Icons.star,
                                            color: AppColors.colorYellow,
                                          );
                                        },
                                        itemCount: 5,
                                        itemSize: 20,
                                        unratedColor: AppColors.colorT2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Social Networks",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.colorT1,
                                ),
                              ),
                            ),
                            Text(
                              "Powered by Google",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.colorT1,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 42,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: club.socialNetworks.length,
                            itemBuilder: (c, i) {
                              final socialNetwork = club.socialNetworks[i];
                              return ButtonSocialNetwork(
                                code: socialNetwork.code,
                                url: socialNetwork.url,
                              );
                            },
                            separatorBuilder: (c, i) =>
                                const SizedBox(width: 8),
                          ),
                        ),
                        CarouselEvents(events: provider.listEventsByClub),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
    );
  }
}
