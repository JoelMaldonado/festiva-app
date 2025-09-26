import 'package:festiva/domain/model/event.dart';
import 'package:festiva/domain/repository/event_repository.dart';
import 'package:festiva/main.dart';
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

  getEventByScheduleId(String eventScheduleId) async {
    isLoadingEvent = true;
    notifyListeners();
    final res = await _repo.getEventSchedule(eventScheduleId);
    res.fold(
      (l) => tagito.e(l.message),
      (r) => event = r,
    );
    isLoadingEvent = false;
    notifyListeners();
  }
}
