import 'dart:io';
import 'dart:async';
import 'dart:core';

import 'package:tennisai/middleware/tennisai_middleware.dart';
import 'package:swagger/api.dart';
import 'package:meta/meta.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/models.dart';
import 'file_storage.dart';
import 'web_client.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// A class that glues together our local file storage and web client. It has a
/// clear responsibility: Load WatchedTournament and Persist WatchedTournaments.
///
/// How and where it stores the entities should confined to this layer, and the
/// Domain layer of your app should only access this repository, not a database
/// or the web directly.
///

class DashboardRepository {
  final FileStorage fileStorage;
  // final WebClient webClient;
  final PlayersApi Function() getPlayerClient;
  final TournamentsApi Function() getTournamentClient;
  const DashboardRepository(
      {@required this.fileStorage,
      // this.webClient,
      this.getPlayerClient,
      this.getTournamentClient});

  Future<Null> saveAuthToken(String authToken) async {
    var storage = new FlutterSecureStorage();
    await storage.write(key: "authToken", value: authToken);
  }

  Future<List<TournamentInfo>> loadUpcomingTournaments(String playerId) async {
    try {
      var result = await fileStorage.loadEnteredTournaments();
      print('dashboard_repository.loadUpcomingTournaments: Returned Futures');
      return result;
    } catch (e) {
      print('LoadUpcomingTournaments Fetcher in error');
      var result = await PlayersApi().getEnteredTournaments(playerId);
      return result.tournaments;
    }
  }

  Future<List<TournamentInfo>> loadWatchedTournaments(String playerId) async {
    try {
      var res = await fileStorage.loadWatchedTournaments();
      print('Returned ${res.length} entries for loadWatchedTournaments');
      return res;
    } catch (e) {
      print('LoadWatchedTournaments Fetcher in error');
      var result = await getApiClient().getWatchedTournaments(playerId);
      // var result = await webClient.fetchWatchedTournaments(playerId);
      print('LoadWatchedTournaments Fetched');
      return result.tournaments;
    }
  }

  // Persists watchedTournament to local disk and the web
  Future saveWatchedTournaments(List<TournamentInfo> tournamentEntitys) {
    return Future.wait([
      fileStorage.saveWatchedTournaments(tournamentEntitys),
      // webClient.postWatchedTournaments(tournamentEntitys),
    ]);
  }

  saveSettings(Settings setting) {
    print(setting.toJson());
    // Todo: Persist to secure storage.
    var flutterSecureStorage = new FlutterSecureStorage();
    return flutterSecureStorage.write(
        key: "authtoken", value: setting.azureAuthToken);
  }

  Future<List<Entrant>> loadTournamentEntrants(String tournamentId) async {
    var result = TournamentsApi().entrants(tournamentId);
    return result;
  }

  // Persists watchedTournament to local disk and the web
  Future saveEnteredTournaments(List<TournamentInfo> tournamentEntitys) {
    return Future.wait([
      fileStorage.saveEnteredTournaments(tournamentEntitys),
      // webClient.postEnteredTournaments(tournamentEntitys),
    ]);
  }

  Future<List<Settings>> loadPlayerSettingsFromDevice() async {
    var playerSettings = await fileStorage.loadPlayerSettings();
    return playerSettings;
  }

  Future<List<Player>> loadPlayerProfile(String playerId) async {
    var res = await fileStorage.loadPlayerProfile();
    if (res.isNotEmpty) return res;

    try {
      var player = await PlayersApi().getPlayerProfile(playerId);
      if (player == null) return new List<Player>();
      return new List<Player>()..add(player);
    } catch (e) {
      print(e);
      return new List<Player>();
    }
  }

  Future<List<Player>> loadPlayerProfileDirect(String playerId) async {
    try {
      var result = await PlayersApi().getPlayerProfile(playerId);
      return new List<Player>()..add(result);
    } catch (e) {
      print('Fetcher in error $e');
      return new List<Player>();
    }
  }

  Future savePlayerSettings(Settings playerSettings) {
    return fileStorage.savePlayerSettings(playerSettings);
  }

  // Persists PlayerProfile to local disk and the web
  Future savePlayerProfile(Player playerEntity) {
    return Future.wait([
      fileStorage.savePlayerProfile(playerEntity),
      PlayersApi().createPlayer(playerDto: playerEntity)
    ]);
  }

  // Persists SearchPreference to local disk and the web
  Future saveSearchTournaments(List<Tournament> searchTournaments) {
    return Future.wait([
      fileStorage.saveSearchTournaments(searchTournaments),
    ]);
  }

  // Persists Avatar image
  Future saveProfileAvatar(String playerId, File avatar) {
    return new Future.value(true);
  }

  // // Search Preference
  // /// Loads Search Preference first from File storage. If they don't exist or encounter an
  // /// error, it attempts to load the SearchPrefence from a Web Client
  // Future<List<Tournament>> loadSearchTournaments(String playerId) async {
  //   try {
  //     var res = await fileStorage.loadSearchTournaments();
  //     return res;
  //   } catch (e) {
  //     print('Fetcher in error');
  //     var result = webClient.fetchSearchTournaments(playerId);
  //     print('Fetched');
  //     return result;
  //   }
  // }

  Future<List<Tournament>> loadTournamentsWithSearchPreference(
      SearchPreference searchPreference) {
    return Future.value(new List<Tournament>());
  }

  // Basket
  /// Loads Player Profile first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the watchedTournament from a Web Client
  Future<List<Basket>> loadBasket(String playerId) async {
    try {
      var res = await fileStorage.loadBasket();
      return res;
    } catch (e) {
      print('Fetcher for Basket in error');

      var result = await getApiClient().getPlayerBasket(playerId);
      return new List<Basket>()..add(result);
    }
  }

  // Persists PlayerProfile to local disk and the web
  Future saveBasket(Basket basketEntity) {
    return Future.wait([fileStorage.saveBasket(basketEntity)]);
  }

  Future saveToLtaBasket(Basket basketEntity) {
    return Future.wait([
      // TODO
      // getPlayerClient().postBasketToLta(basketEntity),
    ]);
  }

  // Main
  /// Loads Ranking Info from File storage. If they don't exist or encounter an
  /// error, it attempts to load the rankingInfo from a Web Client
  Future<List<RankingInfo>> loadRankingInfos(String playerId) async {
    try {
      var res = await fileStorage.loadRankingInfos();
      return res;
    } catch (e) {
      print('Fetcher for Basket in error');
      // var result = webClient.fetchRankingInfos(playerId);
      print('dashboard_repository.loadRankingInfo()..RankingInfos Fetched');
      return new List<RankingInfo>();
    }
  }

  Future<List<MatchResultInfo>> loadMatchResultInfos(String playerId) async {
    var res = await fileStorage.loadMatchResultInfos();
    if (res.isNotEmpty) return res;

    try {
      var matchResults = await PlayersApi().getMatchResults(playerId);
      return matchResults;
    } catch (e) {
      print(
          'dashboard_repository.loadMatchResultInfos()..Error ' + e.toString());
      return new List<MatchResultInfo>();
    }
  }

  Future saveRankingInfos(List<RankingInfo> rankingInfoEntitys) {
    return fileStorage.saveRankingInfos(rankingInfoEntitys);
  }

  Future saveMatchResultInfos(List<MatchResultInfo> matchResultInfoEntitys) {
    return fileStorage.saveMatchResultInfos(matchResultInfoEntitys);
  }
}
