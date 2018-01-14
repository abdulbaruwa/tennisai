import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../models/models.dart';

enum StoreNames {
  enteredTournamens,
  watchedTournaments,
  searchTournaments,
  profile,
  preference,
  basket
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

    return watchedTournaments;
  }

  Future<File> saveWatchedTournaments(
      List<TournamentEntity> watchedTournaments) async {
    final file = await _getLocalFile(StoreNames.watchedTournaments);
    var watchedTournamentsJson =
        watchedTournaments.map((t) => t.toJson()).toList();
    return file.writeAsString(new JsonEncoder()
        .convert({'watchedTournaments': watchedTournamentsJson}));
  }

  Future<List<TournamentEntity>> loadEnteredTournaments() async {
    final file = await _getLocalFile(StoreNames.enteredTournamens);
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final enteredTournaments =
        (json['watchedTournaments'] as List<Map<String, dynamic>>)
            .map((tournament) => TournamentEntity.fromJson(tournament))
            .toList();

    return enteredTournaments;
  }

  Future<File> saveEnteredTournaments(
      List<TournamentEntity> enteredTournaments) async {
    final file = await _getLocalFile(StoreNames.enteredTournamens);
    var enteredTournamentsJson =
        enteredTournaments.map((t) => t.toJson()).toList();
    return file.writeAsString(new JsonEncoder()
        .convert({'watchedTournaments': enteredTournamentsJson}));
  }

  Future<File> _getLocalFile(StoreNames name) async {
    final dir = await getDirectory();

    return new File('${dir.path}/${name.toString()}Storage__$tag.json');
  }

  Future<FileSystemEntity> clean(StoreNames name) async {
    final file = await _getLocalFile(name);

    return file.delete();
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
        new JsonEncoder().convert({'playerProfile': searchPrefJson}));
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
    final basketEntity = (json['basket'] as List<Map<String, dynamic>>)
        .map((player) => BasketEntity.fromJson(player))
        .toList();

    return basketEntity;
  }

  Future<File> saveBasket(BasketEntity basket) async {
    final file = await _getLocalFile(StoreNames.basket);
    var basketJson = basket.toJson();
    return file
        .writeAsString(new JsonEncoder().convert({'basket': basketJson}));
  }
}
