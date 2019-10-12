import 'dart:io';
import 'package:swagger/api.dart';
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

List<TournamentInfo> enteredTournamentSelector(AppState state) =>
    state.enteredTournaments;
List<TournamentInfo> watchedTournamentSelector(AppState state) =>
    state.watchedTournaments;
List<TournamentInfo> upcomingTournamentSelector(AppState state) => state.upcomingTournaments;

Optional<Settings> settingSelector(AppState state) {
  try {
    return new Optional.of(state.settings.first);
  } catch (e) {
    return new Optional.absent();
  }
}

List<TournamentInfo> tournamentsSelector(
    AppState state, TournamentDetailsActionSource source) {
  if (source == TournamentDetailsActionSource.upcoming) {
    return state.upcomingTournaments;
  }
  // if (source == TournamentDetailsActionSource.watching) {
  //   return state.watchedTournaments;
  // }
  // if (source == TournamentDetailsActionSource.search) {
  //   return state.searchTournaments;
  // }
  return [];
}

Optional<TournamentInfo> tournamentSelector(
    List<TournamentInfo> tournaments, String code) {
  try {
    return new Optional.of(tournaments.firstWhere((t) => t.code == code));
  } catch (e) {
    return new Optional.absent();
  }
}

List<Entrant> tournamentEntrantsSelector(TournamentInfo tournament, bool sortOrder) {
  // Call api to get entrants from here.
  return new List<Entrant>();
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
bool isLoadingLocalSession(AppState state) => state.isLoadingLocalState;
bool isSignedInSelector(AppState state) => state.isSignedIn;
PlayerRegistrationStatus isRegisteredUserSelector(AppState state) => state.isSignInUserRegistered;

bool isEntrantsViewItemsReversedSelector(AppState state) =>
    state.isEntrantsViewItemsReverseSorted;

bool activeEntrantsSortOrderSelector(AppState state) =>
    state.activeEntrantsSortOrder;

Optional<RegistrationInfo> registrationInfoSelector(AppState state) {
  try {
    return new Optional.of(state.registrationInfo.first);
  } catch (e) {
    return new Optional.absent();
  }
}