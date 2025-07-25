import 'package:festiva/domain/model/event_category.dart';
import 'package:festiva/domain/repository/event_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeProvider extends ChangeNotifier {
  final EventRepository _repo;

  HomeProvider(this._repo);

  int? categorySelected;
  List<EventCategory> eventCategories = [];

  getCatEvents() async {
    if (eventCategories.isNotEmpty) return;
    final res = await _repo.allEventCategories();
    res.fold(
      (l) => Fluttertoast.showToast(msg: "No se pudo obtener las categorias"),
      (r) {
        r.insert(0, EventCategory(id: null, title: 'All'));
        eventCategories.addAll(r);

        notifyListeners();
      },
    );
  }

  setCategorySelected(int? index) {
    categorySelected = index;
    notifyListeners();
  }
}
