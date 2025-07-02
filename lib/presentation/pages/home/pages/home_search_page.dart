import 'package:festiva/presentation/pages/artist_detail/detail_artist_page.dart';
import 'package:festiva/presentation/pages/club_detail/club_detail_page.dart';
import 'package:festiva/presentation/pages/event_detail/detail_event_page.dart';
import 'package:festiva/presentation/pages/home/providers/home_search_provider.dart';
import 'package:festiva/presentation/widgets/widgets.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeSearchProvider>(context, listen: false).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeSearchProvider>(context);
    return AppScaffold(
      child: Column(
        spacing: 16,
        children: [
          AppTextField(
            placeholder: "Buscar",
            controller: provider.searchController,
            focusNode: provider.searchFocusNode,
            prefixIcon: Icon(Icons.search),
            suffixIcon: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.close),
            ),
          ),
          if (provider.searchItems.isEmpty &&
              provider.searchController.text.isNotEmpty)
            const Text("No se encontraron resultados")
          else
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final item = provider.searchItems[index];
                  return ListTile(
                    title: Text(item.detail),
                    onTap: () {
                      Navigator.pop(context);
                      switch (item.type) {
                        case "A":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailArtistPage(
                                idArtist: item.id,
                              ),
                            ),
                          );
                          break;

                        case "C":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ClubDetailPage(
                                idClub: item.id,
                              ),
                            ),
                          );
                          break;

                        case "E":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailEventPage(
                                idEvent: item.id,
                              ),
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
    );
  }
}
