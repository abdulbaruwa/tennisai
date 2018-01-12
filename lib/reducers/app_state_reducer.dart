import '../models/models.dart';
import 'reducers.dart';

AppState appReducer(AppState state, action) {
  return new AppState(
      isLoading: loadingReducer(state.isLoading, action),
      player: playerReducer(state.player, action),
      watchedTournaments: dashboardReducer(state.watchedTournaments, action) ,
      enteredTournaments: dashboardReducer(state.enteredTournaments, action) ,
      tournaments: dashboardReducer(state.tournaments, action) ,
      activeTab: tabsReducer(state.activeTab, action),
      activeEntrantsSortOrder: entrantsSortReducer(state.activeEntrantsSortOrder, action));
}