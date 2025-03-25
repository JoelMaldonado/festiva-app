import 'package:dartz/dartz.dart';
import 'package:festiva_flutter/core/error/failure.dart';
import 'package:festiva_flutter/domain/model/event.dart';
import 'package:festiva_flutter/domain/model/event_category.dart';

abstract class EventRepository {
  Future<Either<Failure, List<Event>>> allEvents();
  Future<Either<Failure, List<EventCategory>>> allEventCategories();
  Future<Either<Failure, Event>> get(int id);
}
