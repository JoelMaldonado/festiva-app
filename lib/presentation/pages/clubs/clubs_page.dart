import 'package:festiva/presentation/components/components.dart';
import 'package:festiva/presentation/pages/club_detail/club_detail_page.dart';
import 'package:festiva/presentation/pages/home/components/search_component.dart';
import 'package:festiva/presentation/providers/club_provider.dart';
import 'package:festiva/presentation/widgets/custom_app_bar.dart';
import 'package:festiva/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClubsPage extends StatefulWidget {
  const ClubsPage({super.key});

  @override
  State<ClubsPage> createState() => _ClubsPageState();
}

class _ClubsPageState extends State<ClubsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final pr = Provider.of<ClubProvider>(context, listen: false);
      pr.getClubs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ClubProvider>(context);
    return AppScaffold(
      appBar: CustomAppBar(
        title: "Clubs",
        detail: "Closer to you",
        hideBackButton: true,
      ),
      child: Column(
        spacing: 16,
        children: [
          SearchComponent(),
          Expanded(
            child: ListView.separated(
              itemCount: provider.clubs.length,
              itemBuilder: (context, index) {
                final club = provider.clubs[index];
                return CardClub(
                  key: Key(club.id.toString()),
                  club: club,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ClubDetailPage(
                          idClub: club.id,
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 16),
            ),
          ),
        ],
      ),
    );
  }
}
