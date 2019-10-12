import 'package:redux/redux.dart';
import '../actions/actions.dart';
import 'package:swagger/api.dart';

final dashboardReducer = combineReducers<List<TournamentInfo>>([
  new TypedReducer<List<TournamentInfo>, WatchedTournamentsLoadedAction>(
      _setLoadedWatchedTournaments),
  new TypedReducer<List<TournamentInfo>, WatchedTournamentsNotLoadedAction>(
      _setNoWatchedTournaments),
  new TypedReducer<List<TournamentInfo>, AddWatchedTournamentsAction>(
      _addWatchedTournament),
  new TypedReducer<List<TournamentInfo>, RemoveFromWatchedTournamentsAction>(
      _removeFromWatchedTournaments),
]);

List<TournamentInfo> _setLoadedWatchedTournaments(
    List<TournamentInfo> watchedTournaments,
    WatchedTournamentsLoadedAction action) {
    return action.watchedTournaments;
}

List<TournamentInfo> _setNoWatchedTournaments(List<TournamentInfo> watchedTournaments,
    WatchedTournamentsNotLoadedAction action) {
  return [];
}

List<TournamentInfo> _addWatchedTournament(
    List<TournamentInfo> watchedTournaments, AddWatchedTournamentsAction action) {
  if (watchedTournaments.contains(action.tournament) == false) {
    return new List.from(watchedTournaments)..add(action.tournament);
  }
  return watchedTournaments;
}

List<TournamentInfo> _removeFromWatchedTournaments(List<TournamentInfo> watchedTournaments, RemoveFromWatchedTournamentsAction action) {
  return watchedTournaments
      .where((watchedTournament) =>
          watchedTournament.code != action.tournamentCode)
      .toList();
}