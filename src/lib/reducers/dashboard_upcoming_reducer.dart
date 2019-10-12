import 'dart:io';
import 'package:redux/redux.dart';
import '../actions/actions.dart';
import 'package:swagger/api.dart';

final dashboardUpcomingReducer = combineReducers<List<TournamentInfo>>([
  new TypedReducer<List<TournamentInfo>, EnteredTournamentsLoadedAction>(
      _setLoadedEnteredTournaments),
  new TypedReducer<List<TournamentInfo>, UpcomingTournamentsLoadedAction>(
      _setLoadedUpcomingTournaments),
  new TypedReducer<List<TournamentInfo>, EnteredTournamentsNotLoadedAction>(
      _setNoEnteredTournaments),
]);

List<TournamentInfo> _setLoadedEnteredTournaments(
    List<TournamentInfo> enteredTournaments,
    EnteredTournamentsLoadedAction action) {
  return action.enteredTournaments;
}

List<TournamentInfo> _setLoadedUpcomingTournaments(
    List<TournamentInfo> upcomingTournaments,
    UpcomingTournamentsLoadedAction action) {
  return action.upcomingTournaments;
}

List<TournamentInfo> _setNoEnteredTournaments(List<TournamentInfo> enteredTournaments,
    EnteredTournamentsNotLoadedAction action) {
  return [];
}

final avatarUpdateReducer = combineReducers<List<File>>(
    [new TypedReducer<List<File>, ChangedAvatarAction>(_setChangedAvatar)]);

List<File> _setChangedAvatar(List<File> image, ChangedAvatarAction action) {
  return new List<File>()..add(action.avatar);
}
