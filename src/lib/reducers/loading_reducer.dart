import 'package:redux/redux.dart';
import '../actions/actions.dart';

final loadingReducer = combineReducers<bool>([
  new TypedReducer<bool, PlayerLoadedAction>(_setLoaded),
  new TypedReducer<bool, PlayerNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}
