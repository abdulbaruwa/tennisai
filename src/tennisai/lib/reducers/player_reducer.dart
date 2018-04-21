import 'package:redux/redux.dart';
import '../models/models.dart';
import '../actions/actions.dart';

final playerReducer = combineReducers<List<Player>>([
  new TypedReducer<List<Player>, PlayerLoadedAction>(_setLoadedPlayer),
  new TypedReducer<List<Player>, PlayerNotLoadedAction>(_setNoPlayer),
  new TypedReducer<List<Player>,  UpdatePlayerProfileAndSearchPreferenceAction>(_updatePlayer)
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