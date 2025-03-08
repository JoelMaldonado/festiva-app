import 'package:dartz/dartz.dart';
import 'package:festiva_flutter/core/error/failure.dart';
import 'package:festiva_flutter/domain/model/event.dart';

abstract class EventRepository {
  Future<Either<Failure, List<Event>>> allEvents();
}
