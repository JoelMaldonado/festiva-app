import 'dart:async';

import 'package:festiva/domain/model/search_item.dart';
import 'package:festiva/domain/repository/common_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeSearchProvider extends ChangeNotifier {
  final CommonRepository _commonRepository;

  HomeSearchProvider(this._commonRepository) {
    searchController.addListener(_onSearchChanged);
  }

  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();
  Timer? _debounce;

  List<SearchItem> searchItems = [];

  init() {
    searchController.clear();
    searchItems = List.empty();
    searchFocusNode.requestFocus();
    notifyListeners();
  }

  _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), () {
      final query = searchController.text.trim();
      if (query.isNotEmpty) {
        _performSearch(query);
      }
    });
  }

  Future<void> _performSearch(String query) async {
    try {
      final res = await _commonRepository.search(query);
      res.fold(
        (l) => Fluttertoast.showToast(msg: l.message),
        (r) => searchItems = List.of(r),
      );
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
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
