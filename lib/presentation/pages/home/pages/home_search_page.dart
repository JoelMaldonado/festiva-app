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
              )
            ],
          ),
        ),
      ),
    );
  }
}
