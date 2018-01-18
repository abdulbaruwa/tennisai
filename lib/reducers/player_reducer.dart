import 'package:redux/redux.dart';
import '../models/models.dart';
import '../actions/actions.dart';

final playerReducer = combineTypedReducers<List<Player>>([
  new ReducerBinding<List<Player>, PlayerLoadedAction>(_setLoadedPlayer),
  new ReducerBinding<List<Player>, PlayerNotLoadedAction>(_setNoPlayer),
  new ReducerBinding<List<Player>,  UpdatePlayerProfileAndSearchPreferenceAction>(_updatePlayer)
]);

List<Player> _setLoadedPlayer(List<Player> player, PlayerLoadedAction action) {
  return action.player;
}

List<Player> _setNoPlayer(List<Player> player, PlayerNotLoadedAction action) {
  return null;
}

List<Player> _updatePlayer(List<Player> player, UpdatePlayerProfileAndSearchPreferenceAction action) {
  return new List<Player>()..add(action.player);
}