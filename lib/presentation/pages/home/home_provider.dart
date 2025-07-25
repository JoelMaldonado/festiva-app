import 'package:festiva/domain/model/event_category.dart';
import 'package:festiva/domain/repository/event_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeProvider extends ChangeNotifier {
  final EventRepository _repo;

  HomeProvider(this._repo);
}
