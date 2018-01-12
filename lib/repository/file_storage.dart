import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../models/models.dart';

enum StoreNames { enteredTournamens, watchedTournaments, profile }

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
}
