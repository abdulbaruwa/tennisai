import 'package:redux/redux.dart';
import '../actions/actions.dart';

final loadingReducer = combineTypedReducers<bool>([
  new ReducerBinding<bool, PlayerLoadedAction>(_setLoaded),
  new ReducerBinding<bool, PlayerNotLoadedAction>(_setLoaded),
  new ReducerBinding<bool, WatchedTournamentsLoadedAction>(_setLoaded),
  new ReducerBinding<bool, WatchedTournamentsNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}
