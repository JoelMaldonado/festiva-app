import 'package:dartz/dartz.dart';
import 'package:festiva/core/error/failure.dart';
import 'package:festiva/domain/model/artist.dart';

abstract class ArtistRepository {
  Future<Either<Failure, List<Artist>>> allArtists();
  Future<Either<Failure, Artist>> get(int id);
}
