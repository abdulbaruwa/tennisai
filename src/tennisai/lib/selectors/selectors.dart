import 'dart:io';
import '../utils/optional.dart';
import '../models/models.dart';

Optional<SearchPreference> activeSearchPreferenceSelector(AppState state) {
  try {
    return new Optional.of(state.activeSearchPreference.first);
  } catch (e) {
    return new Optional.absent();
  }
}

List<RankingInfo> rankingInfosSelector(AppState state) => state.rankingInfos;
List<MatchResultInfo> matchResultInfosSelector(AppState state) => state.matchResultInfos;

List<Tournament> enteredTournamentSelector(AppState state) =>
    state.enteredTournaments;
List<Tournament> watchedTournamentSelector(AppState state) =>
    state.watchedTournaments;
List<Tournament> upcomingTournamentSelector(AppState state) => state.upcomingTournaments;

Optional<Settings> settingSelector(AppState state) {
  try {
    return new Optional.of(state.settings.first);
  } catch (e) {
    return new Optional.absent();
  }
}

// TournamentsSelector returns the combined Watched and entered tournament
List<Tournament> tournamentsSelector(
    AppState state, TournamentDetailsActionSource source) {
  if (source == TournamentDetailsActionSource.upcoming) {
    return state.upcomingTournaments;
  }
  if (source == TournamentDetailsActionSource.watching) {
    return state.watchedTournaments;
  }
  if (source == TournamentDetailsActionSource.search) {
    return state.searchTournaments;
  }
  return [];
}

Optional<Tournament> tournamentSelector(
    List<Tournament> tournaments, String code) {
  try {
    return new Optional.of(tournaments.firstWhere((t) => t.code == code));
  } catch (e) {
    return new Optional.absent();
  }
}

List<Entrant> tournamentEntrantsSelector(
    Tournament tournament, bool sortOrder) {
  var entrants = tournament.entrants;

  entrants.sort((a, b) => sortOrder
      ? b.ranking.compareTo(a.ranking)
      : a.ranking.compareTo(b.ranking));

  return entrants;
}


Optional<Player> playerSelector(AppState state) {
  try {
    return new Optional.of(state.player.first);
  } catch (e) {
    return new Optional.absent();
  }
}

Optional<File> avatarSelector(AppState state) {
  try {
    return new Optional.of(state.avatar.first);
  } catch (e) {
    return new Optional.absent();
  }
}

// Search Preference
Optional<SearchPreference> searchPreferenceSelector(AppState state) {
  try {
    return new Optional.of(state.searchPreference.first);
  } catch (e) {
    return new Optional.absent();
  }
}

// Search Result
List<Tournament> searchTournamentsSelector(AppState state) =>
    state.searchTournaments;

Optional<Basket> basketSelector(AppState state) {
  try {
    return new Optional.of(state.basket.first);
  } catch (e) {
    return new Optional.absent();
  }
}

//List<Entrant> _getEntrant
AppTab activeTabSelector(AppState state) => state.activeTab;

bool isLoadingSelector(AppState state) => state.isLoading;
bool isSignedInSelector(AppState state) => state.isSignedIn;

bool isEntrantsViewItemsReversedSelector(AppState state) =>
    state.isEntrantsViewItemsReverseSorted;

bool activeEntrantsSortOrderSelector(AppState state) =>
    state.activeEntrantsSortOrder;
