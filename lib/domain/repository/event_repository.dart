import 'package:dartz/dartz.dart';
import 'package:festiva/core/error/failure.dart';
import 'package:festiva/domain/model/event.dart';
import 'package:festiva/domain/model/event_category.dart';

abstract class EventRepository {
  Future<Either<Failure, List<Event>>> allEvents({int? clubId});
  Future<Either<Failure, List<EventCategory>>> allEventCategories();
  Future<Either<Failure, Event>> get(String id);
}
