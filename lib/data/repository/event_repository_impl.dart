import 'package:dartz/dartz.dart';
import 'package:festiva_flutter/core/error/failure.dart';
import 'package:festiva_flutter/data/services/event_service.dart';
import 'package:festiva_flutter/domain/model/event.dart';
import 'package:festiva_flutter/domain/model/event_category.dart';
import 'package:festiva_flutter/domain/repository/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  final EventService _service;

  EventRepositoryImpl(this._service);

  @override
  Future<Either<Failure, List<Event>>> allEvents() async {
    try {
      final res = await _service.fetchAll();
      if (res.isSuccess) {
        final map = res.data?.map((e) => e.toDomain()).toList();
        return Right(map ?? []);
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Event>> get(int id) async {
    try {
      final res = await _service.fetch(id);
      if (res.isSuccess) {
        return Right(res.data!.toDomain());
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EventCategory>>> allEventCategories() async {
    try {
      final res = await _service.fetchAllCategories();
      if (res.isSuccess) {
        final map = res.data?.map((e) => e.toDomain()).toList();
        return Right(map ?? []);
      } else {
        return Left(Failure(res.message));
      }
    } catch (err) {
      return Left(Failure(err.toString()));
    }
  }
}
