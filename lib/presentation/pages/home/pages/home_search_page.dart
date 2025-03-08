import 'package:festiva_flutter/presentation/pages/detail_artist/detail_artist_page.dart';
import 'package:festiva_flutter/presentation/pages/detail_club/detail_club_page.dart';
import 'package:festiva_flutter/presentation/pages/detail_event/detail_event_page.dart';
import 'package:festiva_flutter/presentation/pages/home/providers/home_search_provider.dart';
import 'package:festiva_flutter/presentation/theme/theme.dart';
import 'package:festiva_flutter/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeSearchPage extends StatefulWidget {
  const HomeSearchPage({super.key});

  @override
  State<HomeSearchPage> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final provider =
            Provider.of<HomeSearchProvider>(context, listen: false);
        provider.init();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeSearchProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.colorB1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextField(
                placeholder: "Buscar",
                controller: provider.searchController,
                focusNode: provider.searchFocusNode,
                prefixIcon: Icon(Icons.search),
                suffixIcon: GestureDetector(
                  onTap: () {
                    provider.searchController.clear();
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final item = provider.searchItems[index];
                    return ListTile(
                      title: Text(item.detail),
                      onTap: () {
                        switch (item.type) {
                          case "A":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const DetailArtistPage(),
                              ),
                            );
                            break;

                          case "C":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const DetailClubPage(),
                              ),
                            );
                            break;

                          case "E":
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const DetailEventPage(),
                              ),
                            );
                            break;
                        }
                      },
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemCount: provider.searchItems.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
