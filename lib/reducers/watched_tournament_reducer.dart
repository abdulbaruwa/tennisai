import 'package:redux/redux.dart';
import '../actions/actions.dart';
import '../models/models.dart';
import '../selectors/selectors.dart';

final watchedTournamentReducer = combineTypedReducers<List<Tournament>>([
  new ReducerBinding<List<Tournament>, WatchedTournamentsLoadedAction>(_setLoadedWatchedTournaments),
  new ReducerBinding<List<Tournament>, WatchedTournamentsNotLoadedAction>(_setNoWatchedTournaments)
]);

List<Tournament> _setLoadedWatchedTournaments(List<Tournament> watchedTournaments, WatchedTournamentsLoadedAction action ){return action.watchedTournaments;}
List<Tournament> _setNoWatchedTournaments(List<Tournament> watchedTournaments, WatchedTournamentsNotLoadedAction action){return [];}