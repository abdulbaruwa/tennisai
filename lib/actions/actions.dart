import '../models/models.dart';

class LoadPlayerAction {}

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
