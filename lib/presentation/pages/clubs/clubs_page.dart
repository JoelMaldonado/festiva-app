import 'package:festiva/presentation/components/components.dart';
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
      Provider.of<ClubProvider>(context, listen: false).getClubs();
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
        spacing: 8,
        children: [
          SearchComponent(),
          Expanded(
            child: ListView.separated(
              itemCount: provider.listUiClubs.length,
              padding: EdgeInsets.symmetric(vertical: 24),
              itemBuilder: (context, index) {
                final club = provider.listUiClubs[index];
                return CardClub(
                  id: club.id,
                  name: club.name,
                  coverUrl: club.coverUrl,
                  logoUrl: club.logoUrl,
                  address: club.address,
                  isOpen: club.isOpen(),
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
