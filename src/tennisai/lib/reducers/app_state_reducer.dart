import '../models/models.dart';
import 'reducers.dart';

AppState appReducer(AppState state, action) {
  return new AppState(
      isLoading: loadingReducer(state.isLoading, action),
      player: playerReducer(state.player, action),
      basket: basketReducer(state.basket, action),
      searchPreference: searchPreferenceReducer(state.searchPreference, action),
      activeSearchPreference: searchPreferenceReducer(state.activeSearchPreference, action),
      watchedTournaments: dashboardReducer(state.watchedTournaments, action) ,
      upcomingTournaments: dashboardUpcomingReducer(state.upcomingTournaments, action),
      searchTournaments: tournamentSearchReducer(state.searchTournaments, action) ,
      //tournaments: dashboardReducer(state.tournaments, action) ,
      activeTab: tabsReducer(state.activeTab, action),
      matchResultInfos: matchResultInfoReducer(state.matchResultInfos, action),
      rankingInfos: rankingInfoReducer(state.rankingInfos, action),
      activeEntrantsSortOrder: entrantsSortReducer(state.activeEntrantsSortOrder, action));

}
