import 'dart:io';
import 'dart:async';
import 'dart:core';

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
class DashboardRepository {
  final FileStorage fileStorage;
  final WebClient webClient;

  const DashboardRepository({
    @required this.fileStorage,
    this.webClient = const WebClient(),
  });

  Future<Null> saveAuthToken(String authToken)async{
    var storage = new FlutterSecureStorage();
    await storage.write(key: "authToken", value: authToken);
  }
  
  Future<List<TournamentEntity>> loadUpcomingTournaments() async {
    try {
      var result = await fileStorage.loadEnteredTournaments();
      print('dashboard_repository.loadUpcomingTournaments: Returned Futures');
      return result;
    } catch (e) {
      print('LoadUpcomingTournaments Fetcher in error');
      var result = webClient.fetchEnteredTournaments();
      return result;
    }
  }

  /// Loads watched Tournaments first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the watchedTournament from a Web Client
  Future<List<TournamentEntity>> loadWatchedTournaments() async {
    try {
      var res = await fileStorage.loadWatchedTournaments();
      print('Returned ${res.length} entries for loadWatchedTournaments');
      return res;
    } catch (e) {
      print('LoadWatchedTournaments Fetcher in error');
      var result = await webClient.fetchWatchedTournaments();
      print('LoadWatchedTournaments Fetched');
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

  // saveSettings(Settings setting){
  //   print(setting.toJson());
  //   // Todo: Persist to secure storage.
  //   var flutterSecureStorage = new FlutterSecureStorage();
  //   return flutterSecureStorage.write(key: "authtoken", value: setting.azureAuthToken);
  // }
  /// Loads entered Tournaments first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the enteredTournament from a Web Client.
  Future<List<TournamentEntity>> loadEnteredTournaments() async {
    try {
      var res = await fileStorage.loadEnteredTournaments();
      print('Returne ${res.length} entries for  loadEnteredTournaments ');
      return res;
    } catch (e) {
      print('LoadEnteredTournaments Fetcher in error');
      var result = webClient.fetchEnteredTournaments();
      print('LoadEnteredTournaments Fetched');
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

  Future saveUpcomingTournaments(List<TournamentEntity> tournamentEntitys) {
    return Future.wait([
      webClient.postEnteredTournaments(tournamentEntitys),
    ]);
  }

  // Player Profile
  /// Loads Player Profile first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the watchedTournament from a Web Client
  Future<List<PlayerEntity>> loadPlayerProfile(String playerId) async {
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

  // Persists Avatar image
  Future saveProfileAvatar(String playerId, File avatar)
  {
    print('dashboard_repository: saveProfileAvatar..TODO..');
    return Future.wait([webClient.postAvatarImage(playerId, avatar)]);
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

  Future<List<TournamentEntity>> loadTournamentsWithSearchPreference(SearchPreference searchPreference){
    return webClient.loadTournamentsWithSearchPreference(searchPreference);
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

  // Persists PlayerProfile to local disk and the web
  Future saveBasket(BasketEntity basketEntity) {
    return Future.wait([
      fileStorage.saveBasket(basketEntity),
      webClient.postBasket(basketEntity),
    ]);
  }

  Future saveToLtaBasket(BasketEntity basketEntity) {
    return Future.wait([
      webClient.postToLtaBasket(basketEntity),
    ]);
  }
  // Main
  /// Loads Ranking Info from File storage. If they don't exist or encounter an
  /// error, it attempts to load the rankingInfo from a Web Client
  Future<List<RankingInfoEntity>> loadRankingInfos() async {
    try {
      var res = await fileStorage.loadRankingInfos();
      return res;
    } catch (e) {
      print('Fetcher for Basket in error');
      var result = webClient.fetchRankingInfos();
      print('dashboard_repository.loadRankingInfo()..RankingInfos Fetched');
      return result;
    }
  }

  /// Loads MatchResultInfo from File storage. If they don't exist or encounter an
  /// error, it attempts to load the matchResultInfo from a Web Client
  Future<List<MatchResultInfoEntity>> loadMatchResultInfos() async {
    try {
      var res = await fileStorage.loadMatchResultInfos();
      return res;
    } catch (e) {
      print('Fetcher for Basket in error');
      var result = webClient.fetchMatchResultInfos();
      print('dashboard_repository.loadRankingInfo()..RankingInfos Fetched');
      return result;
    }
  }

  Future saveRankingInfos(List<RankingInfoEntity> rankingInfoEntitys) {
    return fileStorage.saveRankingInfos(rankingInfoEntitys);
  }

  Future saveMatchResultInfos(List<MatchResultInfoEntity> matchResultInfoEntitys) {
    return fileStorage.saveMatchResultInfos(matchResultInfoEntitys);
  }
}
