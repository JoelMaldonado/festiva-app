import 'package:festiva/domain/model/event.dart';
import 'package:festiva/domain/model/event_category.dart';
import 'package:festiva/domain/repository/event_repository.dart';
import 'package:flutter/material.dart';

class EventsListProvider extends ChangeNotifier {
  final EventRepository repo;

  EventsListProvider({
    required this.repo,
  });

  final List<Event> _items = [];
  List<Event> get items => List.unmodifiable(_items);

  int _page = 1;
  final int _limit = 20;
  bool _isLoading = false;
  bool _hasMore = true;
  String? _error;

  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;
  String? get error => _error;

  Future<void> initialLoad() async {
    _page = 1;
    _hasMore = true;
    _items.clear();
    _error = null;
    notifyListeners();
    await _fetch();
  }

  Future<void> fetchNextPage() async {
    if (_isLoading || !_hasMore) return;
    await _fetch();
  }

  Future<void> _fetch() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final res = await repo.allEventsPaged(
      page: _page,
      limit: _limit,
      categoryId: selectedCategory?.id,
      date: selectedDate,
    );

    res.fold(
      (l) {
        _error = l.message;
        _isLoading = false;
        notifyListeners();
      },
      (pageData) {
        if (pageData.isEmpty) {
          _hasMore = false;
        } else {
          _items.addAll(pageData);
          _page += 1;
          if (pageData.length < _limit) _hasMore = false;
        }
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  List<EventCategory> listCategories = [];
  EventCategory? selectedCategory;

  List<DateTime> dates = [];
  DateTime? selectedDate;

  init() {
    getCategories();
    initialLoad();
    getDates();
  }

  getCategories() async {
    if (listCategories.isNotEmpty) return;
    final res = await repo.allEventCategories();
    res.fold(
      (l) {},
      (r) => listCategories.addAll(r),
    );
    notifyListeners();
  }

  getDates() {
    final now = DateTime.now();
    dates = List.generate(7, (index) => now.add(Duration(days: index)));
    notifyListeners();
  }

  setCategorySelected(EventCategory? category) {
    selectedCategory = category;
    initialLoad();
    notifyListeners();
  }

  setDateSelected(DateTime? date) {
    selectedDate = date;
    initialLoad();
    notifyListeners();
  }
}
