import 'package:festiva/domain/model/event.dart';
import 'package:festiva/domain/repository/event_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EventProvider extends ChangeNotifier {
  final EventRepository _repo;

  EventProvider(this._repo);

  List<Event> events = [];
  bool isLoadingEvents = false;

  getEvents() async {
    try {
      if (events.isNotEmpty) return;
      isLoadingEvents = true;
      notifyListeners();
      final res = await _repo.allEvents();
      res.fold(
        (l) {},
        (r) => events = r,
      );
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      isLoadingEvents = false;
      notifyListeners();
    }
  }

  Event? event;
  bool isLoadingEvent = false;

  getEvent(String id) async {
    try {
      isLoadingEvent = true;
      notifyListeners();
      final res = await _repo.getEventSchedule(id);
      res.fold(
        (l) {},
        (r) => event = r,
      );
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      isLoadingEvent = false;
      notifyListeners();
    }
  }
}
