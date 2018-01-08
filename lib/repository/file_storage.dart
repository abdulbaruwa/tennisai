import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../models/models.dart';


/// Loads and saves a List of Todos using a text file stored on the device.
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
    final file = await _getLocalFile();
    final string = await file.readAsString();
    final json = new JsonDecoder().convert(string);
    final watchedTournaments = (json['tournaments'] as List<Map<String, dynamic>>)
        .map((tournament) => TournamentEntity.fromJson(tournament))
        .toList();

    return watchedTournaments;
  }

  Future<File> saveWatchedTournaments(List<TournamentEntity> watchedTournaments) async {
    final file = await _getLocalFile();

    return file.writeAsString(new JsonEncoder().convert({
      'todos': watchedTournaments.map((t) => t.toJson()).toList(),
    }));
  }

  Future<File> _getLocalFile() async {
    final dir = await getDirectory();

    return new File('${dir.path}/WatchedTournamentsStorage__$tag.json');
  }

  Future<FileSystemEntity> clean() async {
    final file = await _getLocalFile();

    return file.delete();
  }
}
