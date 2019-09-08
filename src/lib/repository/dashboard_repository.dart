import 'dart:io';
import 'dart:async';
import 'dart:core';

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
  final WebClient webClient;
  final PlayersApi Function() getPlayerClient;
  const DashboardRepository({@required this.fileStorage, this.webClient, this.getPlayerClient });

  Future<Null> saveAuthToken(String authToken) async {
    var storage = new FlutterSecureStorage();
    await storage.write(key: "authToken", value: authToken);
  }

  Future<List<Tournament>> loadUpcomingTournaments(
      String playerId) async {
    try {
      var result = await fileStorage.loadEnteredTournaments();
      print('dashboard_repository.loadUpcomingTournaments: Returned Futures');
      return result;
    } catch (e) {
      print('LoadUpcomingTournaments Fetcher in error');
      var result = webClient.fetchEnteredTournaments(playerId);
      return result;
    }
  }

  /// Loads watched Tournaments first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the watchedTournament from a Web Client
  Future<List<Tournament>> loadWatchedTournaments(String playerId) async {
    try {
      var res = await fileStorage.loadWatchedTournaments();
      print('Returned ${res.length} entries for loadWatchedTournaments');
      return res;
    } catch (e) {
      print('LoadWatchedTournaments Fetcher in error');
      var result = await webClient.fetchWatchedTournaments(playerId);
      print('LoadWatchedTournaments Fetched');
      return result;
    }
  }

  // Persists watchedTournament to local disk and the web
  Future saveWatchedTournaments(List<Tournament> tournamentEntitys) {
    return Future.wait([
      fileStorage.saveWatchedTournaments(tournamentEntitys),
      webClient.postWatchedTournaments(tournamentEntitys),
    ]);
  }

  saveSettings(Settings setting) {
    print(setting.toJson());
    // Todo: Persist to secure storage.
    var flutterSecureStorage = new FlutterSecureStorage();
    return flutterSecureStorage.write(
        key: "authtoken", value: setting.azureAuthToken);
  }

  /// Loads entered Tournaments first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the enteredTournament from a Web Client.
  Future<List<Tournament>> loadEnteredTournaments(String playerId) async {
    try {
      var res = await fileStorage.loadEnteredTournaments();
      print('Returne ${res.length} entries for  loadEnteredTournaments ');
      return res;
    } catch (e) {
      print('LoadEnteredTournaments Fetcher in error');
      var result = webClient.fetchEnteredTournaments(playerId);
      print('LoadEnteredTournaments Fetched');
      return result;
    }
  }

  // Persists watchedTournament to local disk and the web
  Future saveEnteredTournaments(List<Tournament> tournamentEntitys) {
    return Future.wait([
      fileStorage.saveEnteredTournaments(tournamentEntitys),
      webClient.postEnteredTournaments(tournamentEntitys),
    ]);
  }

  Future saveUpcomingTournaments(List<Tournament> tournamentEntitys) {
    return Future.wait([
      webClient.postEnteredTournaments(tournamentEntitys),
    ]);
  }

  Future<List<Settings>> loadPlayerSettingsFromDevice() async {
    var playerSettings = await fileStorage.loadPlayerSettings();
    return playerSettings;
  }

  // Player Profile
  /// Loads Player Profile first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the watchedTournament from a Web Client
  Future<List<Player>> loadPlayerProfile(String playerId) async {
    try {
      var res = await fileStorage.loadPlayerProfile();
      print('success ${res.length}');
      return res;
    } catch (e) {
      print('Fetcher in error');
      var result = webClient.fetchPlayerProfile(playerId);
      print('Fetched');
      return result;
    }
  }

  Future<List<Player>> loadPlayerProfileDirect(String playerId) async {
    try {
      var result = webClient.getPlayerProfile(playerId);
      return result;
    } catch (e) {
      print('Fetcher in error $e');
      return new List<Player>();
    }
  }

  // Future<List<Player>> loadLatestPlayerProfile(String playerId) async {
  //   try {
  //     var playerProfileDirect = await this.getPlayerClient().getPlayerProfile(playerId);
  //     return webClient.fetchPlayerProfile(playerId);
  //   } catch (e) {
  //     print('LoadLatestPlayerProfile: Error $e');
  //     return new List<Player>();
  //   }
  // }

  Future savePlayerSettings(Settings playerSettings) {
    return fileStorage.savePlayerSettings(playerSettings);
  }

  // Persists PlayerProfile to local disk and the web
  Future savePlayerProfile(Player playerEntity) {
    return Future.wait([
      fileStorage.savePlayerProfile(playerEntity),
      webClient.postPlayerProfile(playerEntity),
    ]);
  }
  
  // Persists SearchPreference to local disk and the web
  Future saveSearchTournaments(List<Tournament> searchTournaments) {
    return Future.wait([
      fileStorage.saveSearchTournaments(searchTournaments),
      webClient.postSearchTournaments(searchTournaments),
    ]);
  }

  // Persists Avatar image
  Future saveProfileAvatar(String playerId, File avatar) {
    print('dashboard_repository: saveProfileAvatar..TODO..');
    return Future.wait([webClient.postAvatarImage(playerId, avatar)]);
  }

  // Search Preference
  /// Loads Search Preference first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the SearchPrefence from a Web Client
  Future<List<Tournament>> loadSearchTournaments(String playerId) async {
    try {
      var res = await fileStorage.loadSearchTournaments();
      print('success ${res.length}');
      return res;
    } catch (e) {
      print('Fetcher in error');
      var result = webClient.fetchSearchTournaments(playerId);
      print('Fetched');
      return result;
    }
  }

  Future<List<Tournament>> loadTournamentsWithSearchPreference(
      SearchPreference searchPreference) {
    return webClient.loadTournamentsWithSearchPreference(searchPreference);
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
      var result = webClient.fetchBasket(playerId);
      print('Basket Fetched');
      return result;
    }
  }

  // Persists PlayerProfile to local disk and the web
  Future saveBasket(Basket basketEntity) {
    return Future.wait([
      fileStorage.saveBasket(basketEntity),
      webClient.postBasket(basketEntity),
    ]);
  }

  Future saveToLtaBasket(Basket basketEntity) {
    return Future.wait([
      webClient.postToLtaBasket(basketEntity),
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
      var result = webClient.fetchRankingInfos(playerId);
      print('dashboard_repository.loadRankingInfo()..RankingInfos Fetched');
      return result;
    }
  }

  /// Loads MatchResultInfo from File storage. If they don't exist or encounter an
  /// error, it attempts to load the matchResultInfo from a Web Client
  Future<List<MatchResultInfo>> loadMatchResultInfos(
      String playerId) async {
    try {
      var res = await fileStorage.loadMatchResultInfos();
      return res;
    } catch (e) {
      print('Fetcher for Basket in error');
      var result = webClient.fetchMatchResultInfos(playerId);
      print('dashboard_repository.loadRankingInfo()..RankingInfos Fetched');
      return result;
    }
  }

  Future saveRankingInfos(List<RankingInfo> rankingInfoEntitys) {
    return fileStorage.saveRankingInfos(rankingInfoEntitys);
  }

  Future saveMatchResultInfos(
      List<MatchResultInfo> matchResultInfoEntitys) {
    return fileStorage.saveMatchResultInfos(matchResultInfoEntitys);
  }
}
