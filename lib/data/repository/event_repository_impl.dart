import 'package:dartz/dartz.dart';
import 'package:festiva_flutter/core/error/failure.dart';
import 'package:festiva_flutter/data/services/event_service.dart';
import 'package:festiva_flutter/domain/model/event.dart';
import 'package:festiva_flutter/domain/repository/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final EventService _service;

  EventRepositoryImpl(this._service);

  @override
  Future<Either<Failure, List<Event>>> allEvents() async {
    try {
      final events = await _service.fetchAll();
      final map = events.map((e) => e.toDomain()).toList();
      return Right(map);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
