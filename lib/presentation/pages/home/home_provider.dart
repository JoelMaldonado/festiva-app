import 'package:dartz/dartz.dart';
import 'package:festiva/core/error/failure.dart';
import 'package:festiva/data/model/response/ui_response.dart';
import 'package:festiva/domain/model/artist.dart';
import 'package:festiva/domain/model/event.dart';
import 'package:festiva/domain/repository/artist_repository.dart';
import 'package:festiva/domain/repository/club_repository.dart';
import 'package:festiva/domain/repository/event_repository.dart';
import 'package:festiva/domain/repository/ui_repository.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final EventRepository eventRepository;
  final ClubRepository clubRepository;
  final ArtistRepository artistRepository;
  final UiRepository uiRepo;

  HomeProvider({
    required this.eventRepository,
    required this.clubRepository,
    required this.artistRepository,
    required this.uiRepo,
  });

  List<UiClub> listClubs = [];
  List<Event> listEvents = [];
  List<Artist> listArtists = [];

  bool isLoading = false;

  Future<void> loadData() async {
    isLoading = true;
    notifyListeners();

    final eventsFuture = eventRepository.allEvents();
    final clubsFuture = uiRepo.fetchClubs(1, 100);
    final artistsFuture = artistRepository.allArtists();

    final results = await Future.wait([
      eventsFuture,
      clubsFuture,
      artistsFuture,
    ]);

    final eventsRes = results[0] as Either<Failure, List<Event>>;
    final clubsRes = results[1] as Either<Failure, FetchUiClubsResponse>;
    final artistsRes = results[2] as Either<Failure, List<Artist>>;

    eventsRes.fold((l) {}, (r) => listEvents = List.of(r));
    clubsRes.fold((l) {}, (r) => listClubs = List.of(r.items));
    artistsRes.fold((l) {}, (r) => listArtists = List.of(r));

    isLoading = false;
    notifyListeners();
  }
}
