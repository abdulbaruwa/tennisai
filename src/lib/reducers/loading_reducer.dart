import 'package:redux/redux.dart';
import '../actions/actions.dart';

final loadingReducer = combineReducers<bool>([
  new TypedReducer<bool, PlayerLoadedAction>(_setLoaded),
  new TypedReducer<bool, PlayerNotLoadedAction>(_setLoaded),
]);

final isLoadingLocalStateReducer = combineReducers<bool>([
  new TypedReducer<bool, NoPlayerSettingsFoundOnDeviceAction>(_setLoadingLocalState)
]);

bool _setLoaded(bool state, action) {
  return false;
}

bool _setLoadingLocalState(bool state, action){
  return false;
}
