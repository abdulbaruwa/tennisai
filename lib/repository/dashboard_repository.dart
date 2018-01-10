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

}
