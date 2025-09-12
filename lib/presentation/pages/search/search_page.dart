import 'package:festiva/app/router.dart';
import 'package:festiva/presentation/pages/artist_detail/detail_artist_page.dart';
import 'package:festiva/presentation/pages/detail_club/detail_club_page.dart';
import 'package:festiva/presentation/pages/search/search_provider.dart';
import 'package:festiva/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SearchProvider>(context, listen: false).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchProvider>(context);
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
                              builder: (_) => DetailClubPage(
                                idClub: item.id,
                              ),
                            ),
                          );
                          break;

                        case "E":
                          GoRouter.of(context).push(
                            AppRoutes.eventDetail,
                            extra: item.id.toString(),
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
