import 'package:festiva/domain/model/event.dart';
import 'package:festiva/domain/model/event_category.dart';
import 'package:festiva/domain/repository/event_repository.dart';
import 'package:flutter/material.dart';

class EventsProvider extends ChangeNotifier {
  final EventRepository repo;

  EventsProvider({
    required this.repo,
  });

  List<Event> listEvents = [];
  List<Event> listEventsFiltered = [];
  bool isLoadingEvents = false;

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

  int categorySelected = 0;
  List<EventCategory> eventCategories = [];

  getCatEvents() async {
    if (eventCategories.isNotEmpty) return;
    final res = await repo.allEventCategories();
    res.fold(
      (l) {},
      (r) {
        r.insert(0, EventCategory(id: 0, title: 'All'));
        eventCategories.addAll(r);
        notifyListeners();
      },
    );
  }

  setCategorySelected(int index) {
    categorySelected = index;
    if (index == 0) {
      listEventsFiltered = List.of(listEvents);
    } else {
      listEventsFiltered = listEvents
          .where((e) => e.idEventCategory == eventCategories[index].id)
          .toList();
    }
    notifyListeners();
  }
}
