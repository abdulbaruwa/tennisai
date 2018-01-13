import 'dart:async';
import 'dart:core';

import 'package:meta/meta.dart';
import '../models/models.dart';
import 'file_storage.dart';
import 'web_client.dart';

/// A class that glues together our local file storage and web client. It has a
/// clear responsibility: Load WatchedTournament and Persist WatchedTournaments.
///
/// How and where it stores the entities should confined to this layer, and the
/// Domain layer of your app should only access this repository, not a database
/// or the web directly.
class DashboardRepository {
  final FileStorage fileStorage;
  final WebClient webClient;

  const DashboardRepository({
    @required this.fileStorage,
    this.webClient = const WebClient(),
  });

  /// Loads watched Tournaments first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the watchedTournament from a Web Client
  Future<List<TournamentEntity>> loadWatchedTournaments() async {
    try {
      var res = await fileStorage.loadWatchedTournaments();
      print('success ${res.length}');
      return res;
    } catch (e) {
      print('Fetcher in error');
      var result = webClient.fetchWatchedTournaments();
      print('Fetched');
      return result;
    }
  }

  // Persists watchedTournament to local disk and the web
  Future saveWatchedTournaments(List<TournamentEntity> tournamentEntitys) {
    return Future.wait([
      fileStorage.saveWatchedTournaments(tournamentEntitys),
      webClient.postWatchedTournaments(tournamentEntitys),
    ]);
  }

  /// Loads entered Tournaments first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the enteredTournament from a Web Client.
  Future<List<TournamentEntity>> loadEnteredTournaments() async {
    try {
      var res = await fileStorage.loadEnteredTournaments();
      print('success ${res.length}');
      return res;
    } catch (e) {
      print('Fetcher in error');
      var result = webClient.fetchEnteredTournaments();
      print('Fetched');
      return result;
    }
  }

  // Persists watchedTournament to local disk and the web
  Future saveEnteredTournaments(List<TournamentEntity> tournamentEntitys) {
    return Future.wait([
      fileStorage.saveEnteredTournaments(tournamentEntitys),
      webClient.postEnteredTournaments(tournamentEntitys),
    ]);
  }

  // Player Profile
    /// Loads Player Profile first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the watchedTournament from a Web Client
  Future<List<PlayerEntity>> loadPlayerProfile() async {
    try {
      var res = await fileStorage.loadPlayerProfile();
      print('success ${res.length}');
      return res;
    } catch (e) {
      print('Fetcher in error');
      var result = webClient.fetchPlayerProfile();
      print('Fetched');
      return result;
    }
  }

  // Persists PlayerProfile to local disk and the web
  Future savePlayerProfile(PlayerEntity playerEntity) {
    return Future.wait([
      fileStorage.savePlayerProfile(playerEntity),
      webClient.postPlayerProfile(playerEntity),
    ]);
  }  
  
  // Search Preference 
  /// Loads Search Preference first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the SearchPrefence from a Web Client
  Future<List<SearchPreferenceEntity>> loadSearchPreference() async {
    try {
      var res = await fileStorage.loadSearchPreference();
      print('success ${res.length}');
      return res;
    } catch (e) {
      print('Fetcher in error');
      var result = webClient.fetchSearchPreference();
      print('Fetched');
      return result;
    }
  }

  // Persists SearchPreference to local disk and the web
  Future saveSearchPreference(SearchPreferenceEntity searchPrefEntity) {
    return Future.wait([
      fileStorage.saveSearchPreference(searchPrefEntity),
      webClient.postSearchPreference(searchPrefEntity),
    ]);
  }
  
  // Persists SearchPreference to local disk and the web
  Future saveSearchTournaments(List<TournamentEntity> searchTournaments) {
    return Future.wait([
      fileStorage.saveSearchTournaments(searchTournaments),
      webClient.postSearchTournaments(searchTournaments),
    ]);
  }

    // Search Preference 
  /// Loads Search Preference first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the SearchPrefence from a Web Client
  Future<List<TournamentEntity>> loadSearchTournaments() async {
    try {
      var res = await fileStorage.loadSearchTournaments();
      print('success ${res.length}');
      return res;
    } catch (e) {
      print('Fetcher in error');
      var result = webClient.fetchSearchTournaments();
      print('Fetched');
      return result;
    }
  }


  // Basket
  /// Loads Player Profile first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the watchedTournament from a Web Client
  Future<List<BasketEntity>> loadBasket() async {
    try {
      var res = await fileStorage.loadBasket();
      return res;
    } catch (e) {
      print('Fetcher for Basket in error');
      var result = webClient.fetchBasket();
      print('Basket Fetched');
      return result;
    }
  }

}
