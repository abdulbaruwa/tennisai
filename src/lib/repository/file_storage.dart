import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:swagger/api.dart';
import '../models/models.dart';

enum StoreNames {
  enteredTournaments,
  watchedTournaments,
  searchTournaments,
  profile,
  preference,
  basket,
  rankingInfos,
  matchResultInfos,
  settings
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
  
  Future<List<Tournament>> loadWatchedTournaments() async {
    final file = await _getLocalFile(StoreNames.watchedTournaments);
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final watchedTournaments =
        (json['watchedTournaments'] as List<Map<String, dynamic>>)
            .map((tournament) => Tournament.fromJson(tournament))
            .toList();

    print('file_storage.LoadEnteredTournaments returned ${watchedTournaments.length}');
    return watchedTournaments;
  }

  Future<File> saveWatchedTournaments(
      List<Tournament> watchedTournaments) async {
    print('file_storage.saveWatchedTournaments: passed ${watchedTournaments.length} entries');
    final file = await _getLocalFile(StoreNames.watchedTournaments);
    var watchedTournamentsJson =
        watchedTournaments.map((t) => t.toJson()).toList();
    print('file_storage.saveWatchedTournaments: json to save $watchedTournamentsJson');
    return file.writeAsString(new JsonEncoder()
        .convert({'watchedTournaments': watchedTournamentsJson}));
  }

  Future<List<Tournament>> loadEnteredTournaments() async {
    final file = await _getLocalFile(StoreNames.enteredTournaments);
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final enteredTournaments =
        (json['enteredTournaments'] as List<Map<String, dynamic>>)
            .map((tournament) => Tournament.fromJson(tournament))
            .toList();
    print('file_storage.LoadEnteredTournaments: returned ${enteredTournaments.length} entries');
    return enteredTournaments;
  }

  Future<File> saveEnteredTournaments(
      List<Tournament> enteredTournaments) async {
    print('file_storage.saveEnteredTournaments: passed ${enteredTournaments.length} entries');
    final file = await _getLocalFile(StoreNames.enteredTournaments);
    var enteredTournamentsJson =
        enteredTournaments.map((t) => t.toJson()).toList();
    print('file_storage.saveEnteredTournaments: json to save $enteredTournamentsJson');
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

  Future<List<Settings>> loadPlayerSettings() async {
    final file = await _getLocalFile(StoreNames.settings);
    if(! await file.exists() )return new List<Settings>();
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final settingss = json['playerSettings'] as Map<String, dynamic>;

     return new List<Settings>()..add(Settings.fromJson(settingss));
  }
  // Player Profile
  Future<List<Player>> loadPlayerProfile() async {
    final file = await _getLocalFile(StoreNames.profile);
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final playerProfileEntity =
        (json['playerProfile'] as List<Map<String, dynamic>>)
            .map((player) => Player.fromJson(player))
            .toList();

    return playerProfileEntity;
  }

  Future<File> savePlayerProfile(Player player) async {
    final file = await _getLocalFile(StoreNames.profile);
    var playerProfileJson = player.toJson();
    return file.writeAsString(
        new JsonEncoder().convert({'playerProfile': playerProfileJson}));
  }

  Future<File> savePlayerSettings(Settings player) async {
    final file = await _getLocalFile(StoreNames.settings);
    var playerSettingsJson = player.toJson();
    return file.writeAsString(
        new JsonEncoder().convert({'playerSettings': playerSettingsJson}));
  }

  Future<List<SearchPreference>> loadSearchPreference() async {
    final file = await _getLocalFile(StoreNames.preference);
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final searchPrefEntity =
        (json['searchPreference'] as List<Map<String, dynamic>>)
            .map((searchPref) => SearchPreference.fromJson(searchPref))
            .toList();

    return searchPrefEntity;
  }

  Future<File> saveSearchPreference(
      SearchPreference searchPrefEntity) async {
    final file = await _getLocalFile(StoreNames.preference);
    var searchPrefJson = searchPrefEntity.toJson();
    return file.writeAsString(
        new JsonEncoder().convert({'searchPreference': searchPrefJson}));
  }

  Future<File> saveSearchTournaments(
      List<Tournament> enteredTournaments) async {
    final file = await _getLocalFile(StoreNames.searchTournaments);
    var searchTournamentJson =
        enteredTournaments.map((t) => t.toJson()).toList();
    return file.writeAsString(
        new JsonEncoder().convert({'searchTournaments': searchTournamentJson}));
  }

  Future<List<Tournament>> loadSearchTournaments() async {
    final file = await _getLocalFile(StoreNames.searchTournaments);
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final searchTournaments =
        (json['searchTournaments'] as List<Map<String, dynamic>>)
            .map((tournament) => Tournament.fromJson(tournament))
            .toList();

    return searchTournaments;
  }

  // Basket
  Future<List<Basket>> loadBasket() async {
    final file = await _getLocalFile(StoreNames.basket);
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final basketEntity = (json['basket'] as Map<String, dynamic>);
    return new List<Basket>()..add(Basket.fromJson(basketEntity));
  }

  Future<File> saveBasket(Basket basket) async {
    final file = await _getLocalFile(StoreNames.basket);
    var basketJson = basket.toJson();
    return file
        .writeAsString(new JsonEncoder().convert({'basket': basketJson}));
  }

  // RankingInfo
  Future<List<RankingInfo>> loadRankingInfos() async {
    final file = await _getLocalFile(StoreNames.rankingInfos);
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final rankingInfoEntity = (json['rankingInfos'] as Map<String, dynamic>);
    return new List<RankingInfo>()..add(RankingInfo.fromJson(rankingInfoEntity));
  }

  // MatchResultInfo
  Future<List<MatchResultInfo>> loadMatchResultInfos() async {
    final file = await _getLocalFile(StoreNames.matchResultInfos);
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final matchResultInfoEntity = (json['matchResultInfos'] as Map<String, dynamic>);
    return new List<MatchResultInfo>()..add(MatchResultInfo.fromJson(matchResultInfoEntity));
  }

  Future<File> saveRankingInfos(
      List<RankingInfo> rankingInfos) async {
    print('file_storage.saveRankingInfos: passed ${rankingInfos.length} entries');
    final file = await _getLocalFile(StoreNames.rankingInfos);
    var rankingInfosJson =
        rankingInfos.map((t) => t.toJson()).toList();
    print('file_storage.saveRankingInfos: json to save $rankingInfosJson');
    return file.writeAsString(new JsonEncoder()
        .convert({'rankingInfos': rankingInfosJson}));
  }

  Future<File> saveMatchResultInfos(
      List<MatchResultInfo> matchResultInfos) async {
    print('file_storage.saveMatchResults: passed ${matchResultInfos.length} entries');
    final file = await _getLocalFile(StoreNames.matchResultInfos);
    var matchResultInfoJson =
        matchResultInfos.map((t) => t.toJson()).toList();
    print('file_storage.saveMatchResultInfo: json to save $matchResultInfoJson');
    return file.writeAsString(new JsonEncoder()
        .convert({'matchResultInfos': matchResultInfoJson}));
  }

}
