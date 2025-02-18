import 'package:flutter/material.dart';

class HomeSearchProvider extends ChangeNotifier {
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();

  init() {
    searchFocusNode.requestFocus();
  }
}
