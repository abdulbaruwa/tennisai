import 'dart:io';
import 'package:redux/redux.dart';
import '../actions/actions.dart';
import '../models/models.dart';

final dashboardUpcomingReducer = combineReducers<List<Tournament>>([
  new TypedReducer<List<Tournament>, EnteredTournamentsLoadedAction>(
      _setLoadedEnteredTournaments),
  new TypedReducer<List<Tournament>, UpcomingTournamentsLoadedAction>(
      _setLoadedUpcomingTournaments),
  new TypedReducer<List<Tournament>, EnteredTournamentsNotLoadedAction>(
      _setNoEnteredTournaments),
]);

List<Tournament> _setLoadedEnteredTournaments(
    List<Tournament> enteredTournaments,
    EnteredTournamentsLoadedAction action) {
  return action.enteredTournaments;
}

List<Tournament> _setLoadedUpcomingTournaments(
    List<Tournament> upcomingTournaments,
    UpcomingTournamentsLoadedAction action) {
  return action.upcomingTournaments;
}

List<Tournament> _setNoEnteredTournaments(List<Tournament> enteredTournaments,
    EnteredTournamentsNotLoadedAction action) {
  return [];
}

final avatarUpdateReducer = combineReducers<List<File>>(
    [new TypedReducer<List<File>, ChangedAvatarAction>(_setChangedAvatar)]);

List<File> _setChangedAvatar(List<File> image, ChangedAvatarAction action) {
  return new List<File>()..add(action.avatar);
}
