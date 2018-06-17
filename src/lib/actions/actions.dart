import 'dart:io';
import '../models/models.dart';
// Main
class LoadRankingInfosAction{}

class LoadMatchResultInfosAction{}

class MatchResultInfoNotLoadedAction{}

class MatchResultInfoLoadedAction {
  final List<MatchResultInfo> matchResultInfos;

  MatchResultInfoLoadedAction(this.matchResultInfos);
}

class RankingInfoNotLoadedAction{}
class RankingInfoLoadedAction {
  final List<RankingInfo> rankingInfos;

  RankingInfoLoadedAction(this.rankingInfos);
}

// Basket
class LoadBasketTournamentsAction {}

// Search Tournament
class LoadSearchTournamentsAction {}

class SearchTournamentWithPreferenceAction{
  final SearchPreference searchPreference;
  SearchTournamentWithPreferenceAction(this.searchPreference);
}

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

class LoadPlayerAction {
  final String playerId;
  LoadPlayerAction(this.playerId);
}

class LoadPlayerFromServerAction {
  final String playerId;
  LoadPlayerFromServerAction(this.playerId);
}

class AddPlayerAction {
  final Player player;
  AddPlayerAction(this.player);
}

class ChangedAvatarAction{
  final File avatar;
  ChangedAvatarAction(this.avatar);
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

class UpdatePlayerProfileAndSearchPreferenceAction {
  final Player player;
  final SearchPreference searchPreference;
  UpdatePlayerProfileAndSearchPreferenceAction(
      {this.player, this.searchPreference});

  @override
  String toString() {
    return 'UpdatePlayerProfileAndSearchPreferenceAction{player: ${player.toString()}, searchPreference: ${searchPreference.toString()}';
  }
}

class RemoveFromWatchedTournamentsAction {
  final String tournamentCode;
  RemoveFromWatchedTournamentsAction(this.tournamentCode);

  @override
  String toString() {
    return 'RemoveFromWatchedTournamentsAction{tournamentCode: $tournamentCode}';
  }
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

   @override
  String toString() {
    return 'AddWatchedTournamentsAction{tournament: ${tournament.toString()}';
  }
}

class SignInWithGoogleAction{}

// Dashboard - Entered Tournament
class EnteredTournamentsNotLoadedAction {}

class EnteredTournamentsLoadedAction {
  final List<Tournament> enteredTournaments;

  EnteredTournamentsLoadedAction(this.enteredTournaments);
}

class UpcomingTournamentsLoadedAction {
  final List<Tournament> upcomingTournaments;

  UpcomingTournamentsLoadedAction(this.upcomingTournaments);
}

class LoadEnteredTournamentsAction {}
class LoadUpcomingTournamentsAction {}

class AddEnteredTournamentsAction {
  final Tournament tournament;
  AddEnteredTournamentsAction(this.tournament);
}

class ToggleEntrantsSortAction {}

class UpdateEntrantSortOrderAction {
  final bool order;
  UpdateEntrantSortOrderAction(this.order);
}

// Basket
class BasketNotLoadedAction {}

class LoadBasketAction {}

class BasketLoadedAction {
  final List<Basket> basket;

  BasketLoadedAction(this.basket);
}

class AddBasketAction {
  final Basket basket;
  AddBasketAction(this.basket);
}

class AddTournamentToBasketAction{
  final Tournament tournament;
  final String playerId;
  AddTournamentToBasketAction(this.tournament, this.playerId);
}

class RemoveTournamentFromBasketAction{
  final String code;
  RemoveTournamentFromBasketAction(this.code);
}

class SendBasketToLtaBasketAction{
  final Basket basket;
  SendBasketToLtaBasketAction(this.basket);
}

class BasketSentToLtaAction{}

class SignInCompletedAction{
  final Settings settings;
  SignInCompletedAction(this.settings);
}

class SignedOutAction{}

class GoogleSilentSignInFailedAction{}
// class ResetCacheAction{}

class CheckSignInUserIsRegisteredAction{
  final Settings settings;
  CheckSignInUserIsRegisteredAction(this.settings);
}

class SignInUserNotRegisteredAction{
  final Settings settings;
  SignInUserNotRegisteredAction(this.settings);
}

class SignInUserIsRegisteredAction{}

class InitStateAction{
  final String playerId;
  InitStateAction(this.playerId);
}

class RegistrationCancelledAction{}

class RegistrationSaveAction{
  final RegistrationInfo registrationInfo;
  RegistrationSaveAction(this.registrationInfo);
}