import '../models/models.dart';
import 'reducers.dart';

AppState appReducer(AppState state, action) {
  return new AppState(
      isLoading: loadingReducer(state.isLoading, action),
      player: playerReducer(state.player, action),
      activeTab: tabsReducer(state.activeTab, action));
}
