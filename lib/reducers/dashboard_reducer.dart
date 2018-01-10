import 'package:redux/redux.dart';
import '../actions/actions.dart';
import '../models/models.dart';
import '../selectors/selectors.dart';

final dashboardReducer = combineTypedReducers<List<Tournament>>([
  new ReducerBinding<List<Tournament>, WatchedTournamentsLoadedAction>(_setLoadedWatchedTournaments),
  new ReducerBinding<List<Tournament>, WatchedTournamentsNotLoadedAction>(_setNoWatchedTournaments),

   new ReducerBinding<List<Tournament>, EnteredTournamentsLoadedAction>(_setLoadedEnteredTournaments),
  new ReducerBinding<List<Tournament>, EnteredTournamentsNotLoadedAction>(_setNoEnteredTournaments),
]);

List<Tournament> _setLoadedWatchedTournaments(List<Tournament> watchedTournaments, WatchedTournamentsLoadedAction action ){return action.watchedTournaments;}
List<Tournament> _setNoWatchedTournaments(List<Tournament> watchedTournaments, WatchedTournamentsNotLoadedAction action){return [];}

List<Tournament> _setLoadedEnteredTournaments(List<Tournament> enteredTournaments, EnteredTournamentsLoadedAction action ){return action.enteredTournaments;}
List<Tournament> _setNoEnteredTournaments(List<Tournament> enteredTournaments, EnteredTournamentsNotLoadedAction action){return [];}