import 'package:redux/redux.dart';
import '../actions/actions.dart';
import 'package:swagger/api.dart';

final dashboardReducer = combineReducers<List<Tournament>>([
  new TypedReducer<List<Tournament>, WatchedTournamentsLoadedAction>(
      _setLoadedWatchedTournaments),
  new TypedReducer<List<Tournament>, WatchedTournamentsNotLoadedAction>(
      _setNoWatchedTournaments),
  new TypedReducer<List<Tournament>, AddWatchedTournamentsAction>(
      _addWatchedTournament),
  new TypedReducer<List<Tournament>, RemoveFromWatchedTournamentsAction>(
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