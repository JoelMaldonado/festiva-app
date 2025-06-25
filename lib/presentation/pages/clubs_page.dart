import 'package:festiva/presentation/components/components.dart';
import 'package:festiva/presentation/pages/club_detail/club_detail_page.dart';
import 'package:festiva/presentation/pages/menu/components/menu_scaffold.dart';
import 'package:festiva/presentation/providers/club_provider.dart';
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
    return MenuScaffold(
      title: 'Clubs',
      subtitle: 'Más cerca de ti',
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: provider.clubs.length,
              itemBuilder: (context, index) {
                final club = provider.clubs[index];
                return CardClub(
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
