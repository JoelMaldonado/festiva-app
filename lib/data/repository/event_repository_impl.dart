import 'package:dartz/dartz.dart';
import 'package:festiva/core/error/failure.dart';
import 'package:festiva/data/services/event_service.dart';
import 'package:festiva/domain/model/event.dart';
import 'package:festiva/domain/model/event_category.dart';
import 'package:festiva/domain/repository/event_repository.dart';
import 'package:festiva/util/date_functions.dart';

class EventRepositoryImpl implements EventRepository {
  final EventService _service;

  EventRepositoryImpl(this._service);

  @override
  Future<Either<Failure, List<Event>>> allEvents({int? clubId}) async {
    try {
      final res = await _service.fetchAll(clubId: clubId);
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
  Future<Either<Failure, List<Event>>> allEventsPaged({
    required int page,
    required int limit,
    required int? categoryId,
    required DateTime? date,
  }) async {
    try {
      final res = await _service.fetchAllPaged(
        page: page,
        limit: limit,
        categoryId: categoryId,
        date: date?.format(pattern: 'yyyy-MM-dd'),
      );
      if (res.isSuccess) {
        final map = res.data?.events.map((e) => e.toDomain()).toList();
        return Right(map ?? []);
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Event>> getEventSchedule(String id) async {
    try {
      final res = await _service.getEventSchedule(id);
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
