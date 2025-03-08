import 'package:festiva_flutter/domain/model/event.dart';
import 'package:festiva_flutter/domain/repository/event_repository.dart';
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
      await Future.delayed(Duration(milliseconds: 300));
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

  getEvent(int id) async {
    try {
      isLoadingEvent = true;
      notifyListeners();
      await Future.delayed(Duration(milliseconds: 300));
      final res = await _repo.get(id);
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
