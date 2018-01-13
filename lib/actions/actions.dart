import '../models/models.dart';

// Basket
class LoadBasketTournamentsAction {}

// Search Tournament 
class LoadSearchTournamentsAction {}
class AddSearchTournamentsAction {
  final List<Tournament> searchTournaments;
  AddSearchTournamentsAction(this.searchTournaments);
}

class SearchTournamentsNotLoadedAction {}
class SearchTournamentsLoadedAction {
  final List<Tournament> searchTournaments;

  SearchTournamentsLoadedAction(this.searchTournaments);
}

class LoadSearchPreferenceAction {}
class AddSearchPreferenceAction {
  final SearchPreference searchPreference;
  AddSearchPreferenceAction(this.searchPreference);
}

class SearchPreferenceNotLoadedAction {}
class SearchPreferenceLoadedAction {
  final List<SearchPreference> searchPreference;

  SearchPreferenceLoadedAction(this.searchPreference);
}

class LoadPlayerAction {}
class AddPlayerAction {
  final Player player;
  AddPlayerAction(this.player);
}

class UpdateTabAction {
  final AppTab newTab;

  UpdateTabAction(this.newTab);
}

class PlayerNotLoadedAction {}

class PlayerLoadedAction {
  final List<Player> player;

  PlayerLoadedAction(this.player);
}

// Dashboard - Watched Tournaments
class WatchedTournamentsNotLoadedAction {}

class WatchedTournamentsLoadedAction {
  final List<Tournament> watchedTournaments;

  WatchedTournamentsLoadedAction(this.watchedTournaments);
}

class LoadWatchedTournamentsAction {}

class AddWatchedTournamentsAction {
  final Tournament tournament;
  AddWatchedTournamentsAction(this.tournament);
}

// Dashboard - Entered Tournament
class EnteredTournamentsNotLoadedAction {}

class EnteredTournamentsLoadedAction {
  final List<Tournament> enteredTournaments;

  EnteredTournamentsLoadedAction(this.enteredTournaments);
}

class LoadEnteredTournamentsAction {}

class AddEnteredTournamentsAction {
  final Tournament tournament;
  AddEnteredTournamentsAction(this.tournament);
}

class ToggleEntrantsSortAction {

} 

class UpdateEntrantSortOrderAction{
  final bool order;
  UpdateEntrantSortOrderAction(this.order);
}

