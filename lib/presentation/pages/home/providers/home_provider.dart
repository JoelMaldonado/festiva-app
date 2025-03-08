import 'package:festiva_flutter/domain/model/cat_event.dart';
import 'package:festiva_flutter/domain/repository/common_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeProvider extends ChangeNotifier {
  final CommonRepository _repo;

  HomeProvider(this._repo);

  int? categorySelected;
  List<CatEvent> catEvents = [];

  init() {
    getCatEvents();
  }

  getCatEvents() async {
    if (catEvents.isNotEmpty) return;
    final res = await _repo.getCatEvents();
    res.fold(
      (l) => Fluttertoast.showToast(msg: "No se pudo obtener los eventos"),
      (r) {
        r.insert(0, CatEvent(id: null, name: 'Todos'));
        catEvents.addAll(r);
        notifyListeners();
      },
    );
  }

  setCategorySelected(int? index) {
    categorySelected = index;
    notifyListeners();
  }
}
