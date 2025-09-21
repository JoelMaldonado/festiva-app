import 'package:festiva/domain/model/event.dart';
import 'package:festiva/domain/model/event_category.dart';
import 'package:festiva/domain/repository/event_repository.dart';
import 'package:flutter/material.dart';

class EventsListProvider extends ChangeNotifier {
  final EventRepository repo;

  EventsListProvider({
    required this.repo,
  });

  List<Event> listEvents = [];
  List<Event> listEventsFiltered = [];
  bool isLoadingEvents = false;

  List<EventCategory> listCategories = [];
  EventCategory? selectedCategory;

  init() {
    getCategories();
    getEvents();
  }

  getEvents() async {
    isLoadingEvents = true;
    notifyListeners();
    final res = await repo.allEvents();
    res.fold(
      (l) {},
      (r) {
        listEvents = List.of(r);
        listEventsFiltered = List.of(r);
      },
    );
    isLoadingEvents = false;
    notifyListeners();
  }

  setCategorySelected(EventCategory? category) {
    selectedCategory = category;
    if (selectedCategory == null) {
      listEventsFiltered = List.of(listEvents);
    } else {
      listEventsFiltered = listEvents
          .where((e) => e.idEventCategory == selectedCategory!.id)
          .toList();
    }
    notifyListeners();
  }

  getCategories() async {
    if (listCategories.isNotEmpty) return;
    final res = await repo.allEventCategories();
    res.fold(
      (l) {},
      (r) {
        listCategories.addAll(r);
        notifyListeners();
      },
    );
  }
}
