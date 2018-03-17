import 'package:redux/redux.dart';
import '../actions/actions.dart';
import '../models/models.dart';

final dashboardReducer = combineTypedReducers<List<Tournament>>([
  new ReducerBinding<List<Tournament>, WatchedTournamentsLoadedAction>(
      _setLoadedWatchedTournaments),
  new ReducerBinding<List<Tournament>, WatchedTournamentsNotLoadedAction>(
      _setNoWatchedTournaments),
  new ReducerBinding<List<Tournament>, AddWatchedTournamentsAction>(
      _addWatchedTournament),
  new ReducerBinding<List<Tournament>, RemoveFromWatchedTournamentsAction>(
      _removeFromWatchedTournaments),
]);

List<Tournament> _setLoadedWatchedTournaments(
    List<Tournament> watchedTournaments,
    WatchedTournamentsLoadedAction action) {
    return action.watchedTournaments;
}

List<Tournament> _setNoWatchedTournaments(List<Tournament> watchedTournaments,
    WatchedTournamentsNotLoadedAction action) {
  return [];
}

List<Tournament> _addWatchedTournament(
    List<Tournament> watchedTournaments, AddWatchedTournamentsAction action) {
  if (watchedTournaments.contains(action.tournament) == false) {
    print('Watched tournament contains ${action.tournament.code}: Count is ${watchedTournaments.length}');
    return new List.from(watchedTournaments)..add(action.tournament);
  }
  return watchedTournaments;
}

List<Tournament> _removeFromWatchedTournaments(List<Tournament> watchedTournaments, RemoveFromWatchedTournamentsAction action) {
  return watchedTournaments
      .where((watchedTournament) =>
          watchedTournament.code != action.tournamentCode)
      .toList();
}