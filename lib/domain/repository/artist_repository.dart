import 'package:dartz/dartz.dart';
import 'package:festiva_flutter/core/error/failure.dart';
import 'package:festiva_flutter/domain/model/artist.dart';

abstract class ArtistRepository {
  Future<Either<Failure, List<Artist>>> allArtists();
}
