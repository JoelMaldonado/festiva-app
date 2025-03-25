import 'package:dartz/dartz.dart';
import 'package:festiva_flutter/core/error/failure.dart';
import 'package:festiva_flutter/data/services/artist_service.dart';
import 'package:festiva_flutter/domain/model/artist.dart';
import 'package:festiva_flutter/domain/repository/artist_repository.dart';

class ArtistRepositoryImpl implements ArtistRepository {
  final ArtistService _service;

  ArtistRepositoryImpl(this._service);

  @override
  Future<Either<Failure, List<Artist>>> allArtists() async {
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
  Future<Either<Failure, Artist>> get(int id) async {
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
}
