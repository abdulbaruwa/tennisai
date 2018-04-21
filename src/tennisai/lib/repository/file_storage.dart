import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../models/models.dart';

enum StoreNames {
  enteredTournaments,
  watchedTournaments,
  searchTournaments,
  profile,
  preference,
  basket,
  rankingInfos,
  matchResultInfos
}

/// Loads and saves a List of Tournament using a text file stored on the device.
///
/// Note: This class has no direct dependencies on any Flutter dependencies.
/// Instead, the `getDirectory` method should be injected. If you're calling
/// this from the
class FileStorage {
  final String tag;
  final Future<Directory> Function() getDirectory;

  const FileStorage(
    this.tag,
    this.getDirectory,
    
  );
  
  Future<List<TournamentEntity>> loadWatchedTournaments() async {
    final file = await _getLocalFile(StoreNames.watchedTournaments);
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final watchedTournaments =
        (json['watchedTournaments'] as List<Map<String, dynamic>>)
            .map((tournament) => TournamentEntity.fromJson(tournament))
            .toList();

    print('file_storage.LoadEnteredTournaments returned ${watchedTournaments.length}');
    return watchedTournaments;
  }

  Future<File> saveWatchedTournaments(
      List<TournamentEntity> watchedTournaments) async {
    print('file_storage.saveWatchedTournaments: passed ${watchedTournaments.length} entries');
    final file = await _getLocalFile(StoreNames.watchedTournaments);
    var watchedTournamentsJson =
        watchedTournaments.map((t) => t.toJson()).toList();
    print('file_storage.saveWatchedTournaments: json to save $watchedTournamentsJson');
    return file.writeAsString(new JsonEncoder()
        .convert({'watchedTournaments': watchedTournamentsJson}));
  }

  Future<List<TournamentEntity>> loadEnteredTournaments() async {
    final file = await _getLocalFile(StoreNames.enteredTournaments);
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final enteredTournaments =
        (json['enteredTournaments'] as List<Map<String, dynamic>>)
            .map((tournament) => TournamentEntity.fromJson(tournament))
            .toList();
    print('file_storage.LoadEnteredTournaments: returned ${enteredTournaments.length} entries');
    return enteredTournaments;
  }

  Future<File> saveEnteredTournaments(
      List<TournamentEntity> enteredTournaments) async {
    print('file_storage.saveEnteredTournaments: passed ${enteredTournaments.length} entries');
    final file = await _getLocalFile(StoreNames.enteredTournaments);
    var enteredTournamentsJson =
        enteredTournaments.map((t) => t.toJson()).toList();
    print('file_storage.saveEnteredTournaments: json to save ${enteredTournamentsJson}');
    return file.writeAsString(new JsonEncoder()
        .convert({'enteredTournaments': enteredTournamentsJson}));
  }

  Future<File> _getLocalFile(StoreNames name) async {
    final dir = await getDirectory();

    return new File('${dir.path}/${name.toString()}Storage__$tag.json');
  }

  Future<FileSystemEntity> clean(StoreNames name) async {
    final file = await _getLocalFile(name);

    return file.delete();
  }

  Future cleanFiles() async{
    for (var file in StoreNames.values ){
      await clean(file);
    }
  }

  // Player Profile
  Future<List<PlayerEntity>> loadPlayerProfile() async {
    final file = await _getLocalFile(StoreNames.profile);
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final playerProfileEntity =
        (json['playerProfile'] as List<Map<String, dynamic>>)
            .map((player) => PlayerEntity.fromJson(player))
            .toList();

    return playerProfileEntity;
  }

  Future<File> savePlayerProfile(PlayerEntity player) async {
    final file = await _getLocalFile(StoreNames.profile);
    var playerProfileJson = player.toJson();
    return file.writeAsString(
        new JsonEncoder().convert({'playerProfile': playerProfileJson}));
  }

  Future<List<SearchPreferenceEntity>> loadSearchPreference() async {
    final file = await _getLocalFile(StoreNames.preference);
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final searchPrefEntity =
        (json['searchPreference'] as List<Map<String, dynamic>>)
            .map((searchPref) => SearchPreferenceEntity.fromJson(searchPref))
            .toList();

    return searchPrefEntity;
  }

  Future<File> saveSearchPreference(
      SearchPreferenceEntity searchPrefEntity) async {
    final file = await _getLocalFile(StoreNames.preference);
    var searchPrefJson = searchPrefEntity.toJson();
    return file.writeAsString(
        new JsonEncoder().convert({'searchPreference': searchPrefJson}));
  }

  Future<File> saveSearchTournaments(
      List<TournamentEntity> enteredTournaments) async {
    final file = await _getLocalFile(StoreNames.searchTournaments);
    var searchTournamentJson =
        enteredTournaments.map((t) => t.toJson()).toList();
    return file.writeAsString(
        new JsonEncoder().convert({'searchTournaments': searchTournamentJson}));
  }

  Future<List<TournamentEntity>> loadSearchTournaments() async {
    final file = await _getLocalFile(StoreNames.searchTournaments);
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final searchTournaments =
        (json['searchTournaments'] as List<Map<String, dynamic>>)
            .map((tournament) => TournamentEntity.fromJson(tournament))
            .toList();

    return searchTournaments;
  }

  // Basket
  Future<List<BasketEntity>> loadBasket() async {
    final file = await _getLocalFile(StoreNames.basket);
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final basketEntity = (json['basket'] as Map<String, dynamic>);
    return new List<BasketEntity>()..add(BasketEntity.fromJson(basketEntity));
  }

  Future<File> saveBasket(BasketEntity basket) async {
    final file = await _getLocalFile(StoreNames.basket);
    var basketJson = basket.toJson();
    return file
        .writeAsString(new JsonEncoder().convert({'basket': basketJson}));
  }

  // RankingInfo
  Future<List<RankingInfoEntity>> loadRankingInfos() async {
    final file = await _getLocalFile(StoreNames.rankingInfos);
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final rankingInfoEntity = (json['rankingInfos'] as Map<String, dynamic>);
    return new List<RankingInfoEntity>()..add(RankingInfoEntity.fromJson(rankingInfoEntity));
  }

  // MatchResultInfo
  Future<List<MatchResultInfoEntity>> loadMatchResultInfos() async {
    final file = await _getLocalFile(StoreNames.matchResultInfos);
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final matchResultInfoEntity = (json['matchResultInfos'] as Map<String, dynamic>);
    return new List<MatchResultInfoEntity>()..add(MatchResultInfoEntity.fromJson(matchResultInfoEntity));
  }

  Future<File> saveRankingInfos(
      List<RankingInfoEntity> rankingInfos) async {
    print('file_storage.saveRankingInfos: passed ${rankingInfos.length} entries');
    final file = await _getLocalFile(StoreNames.rankingInfos);
    var rankingInfosJson =
        rankingInfos.map((t) => t.toJson()).toList();
    print('file_storage.saveRankingInfos: json to save $rankingInfosJson');
    return file.writeAsString(new JsonEncoder()
        .convert({'rankingInfos': rankingInfosJson}));
  }

  Future<File> saveMatchResultInfos(
      List<MatchResultInfoEntity> matchResultInfos) async {
    print('file_storage.saveMatchResults: passed ${matchResultInfos.length} entries');
    final file = await _getLocalFile(StoreNames.matchResultInfos);
    var matchResultInfoJson =
        matchResultInfos.map((t) => t.toJson()).toList();
    print('file_storage.saveMatchResultInfo: json to save $matchResultInfoJson');
    return file.writeAsString(new JsonEncoder()
        .convert({'matchResultInfos': matchResultInfoJson}));
  }

}
