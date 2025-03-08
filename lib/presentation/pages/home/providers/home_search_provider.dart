import 'dart:async';

import 'package:festiva_flutter/domain/model/search_item.dart';
import 'package:festiva_flutter/domain/repository/common_repository.dart';
import 'package:flutter/material.dart';

class HomeSearchProvider extends ChangeNotifier {
  final CommonRepository _commonRepository;

  HomeSearchProvider(this._commonRepository) {
    searchController.addListener(_onSearchChanged);
  }

  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();
  Timer? _debounce;

  init() {
    searchFocusNode.requestFocus();
  }

  _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1500), () {
      final query = searchController.text.trim();
      if (query.isNotEmpty) {
        _performSearch(query);
      }
    });
  }

  List<SearchItem> searchItems = [];

  Future<void> _performSearch(String query) async {
    try {
      final res = await _commonRepository.search(query);
      searchItems = res;
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}
