import 'dart:io';
import 'package:meta/meta.dart';
import 'models.dart';

@immutable
class AppState {
  final bool isLoading;
  final bool isSignedIn;
  final bool isLoadingLocalState;
  final PlayerRegistrationStatus isSignInUserRegistered;
  final bool isEntrantsViewItemsReverseSorted;
  final List<Player> player;
  final List<File> avatar;
  final List<SearchPreference> searchPreference;
  final List<SearchPreference> activeSearchPreference;
  final List<Tournament> tournaments;
  final AppTab activeTab;
  final List<Tournament> enteredTournaments;
  final List<Tournament> watchedTournaments;
  final List<Tournament> searchTournaments;
  final List<Tournament> upcomingTournaments;
  final List<Basket> basket;
  final List<RankingInfo> rankingInfos;
  final List<MatchResultInfo> matchResultInfos;
  final List<Settings> settings;
  final List<RegistrationInfo> registrationInfo;
  final bool activeEntrantsSortOrder;

  AppState(
      {this.isLoading = false,
      this.isSignedIn = false,
      this.isLoadingLocalState = true,
      this.isSignInUserRegistered = PlayerRegistrationStatus.unknown,
      this.player = const [],
      this.avatar = const[],
      this.searchPreference = const [],
      this.activeSearchPreference = const [],
      this.enteredTournaments = const [],
      this.watchedTournaments = const [],
      this.searchTournaments = const [],
      this.upcomingTournaments = const [],
      this.tournaments = const [],
      this.basket = const [],
      this.activeTab = AppTab.home,
      this.matchResultInfos = const [],
      this.rankingInfos = const [],
      this.settings = const [],
      this.registrationInfo = const [],
      this.activeEntrantsSortOrder = false,
      this.isEntrantsViewItemsReverseSorted = false});

  factory AppState.loading() => new AppState(isLoading: true);

  AppState copyWith(
      {bool isLoading,
      bool isSignedIn,
      bool isLoadingLocalState,
      PlayerRegistrationStatus isSignInUserRegistered,
      List<Player> player,
      List<File> avatar,
      List<SearchPreference> searchPreference,
      List<SearchPreference> activeSearchPreference,
      List<Tournament> tournaments,
      List<Tournament> enteredTournaments,
      List<Tournament> watchedTournaments,
      List<Tournament> searchTournaments,
      List<Basket> basket,
      List<Settings> settings,
      List<RegistrationInfo> registrationInfo,
      AppTab activeTab,
      bool isEntrantsViewItemsReverseSorted,
      bool activeEntrantsSortOrder}) {
    return new AppState(
        isLoading: isLoading ?? this.isLoading,
        isSignedIn: isSignedIn ?? this.isSignedIn,
        isLoadingLocalState: isLoadingLocalState ?? this.isLoadingLocalState,
        isSignInUserRegistered:isSignInUserRegistered ?? this.isSignInUserRegistered,
        activeEntrantsSortOrder: activeEntrantsSortOrder ?? activeEntrantsSortOrder,
        avatar: avatar ?? this.avatar,
        player: player ?? this.player,
        basket: basket ?? this.basket,
        settings: settings ?? this.settings,
        searchPreference: searchPreference ?? this.searchPreference,
        activeSearchPreference: activeSearchPreference ?? this.activeSearchPreference,
        tournaments: tournaments ?? this.tournaments,
        searchTournaments: searchTournaments ?? this.searchTournaments,
        watchedTournaments: watchedTournaments ?? this.watchedTournaments,
        enteredTournaments: enteredTournaments ?? this.enteredTournaments,
        registrationInfo:  registrationInfo ?? this.registrationInfo,
        activeTab: activeTab ?? this.activeTab);
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^
      isSignedIn.hashCode ^
      isLoadingLocalState.hashCode ^
      isSignInUserRegistered.hashCode ^
      player.hashCode ^
      avatar.hashCode ^
      basket.hashCode ^
      searchPreference.hashCode ^
      activeSearchPreference.hashCode ^
      activeTab.hashCode ^
      tournaments.hashCode ^
      searchTournaments.hashCode ^
      enteredTournaments.hashCode ^
      watchedTournaments.hashCode ^
      activeEntrantsSortOrder.hashCode ^
      rankingInfos.hashCode ^
      matchResultInfos.hashCode ^
      settings.hashCode ^
      registrationInfo.hashCode ^
      isEntrantsViewItemsReverseSorted.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          isSignedIn == other.isSignedIn &&
          isLoadingLocalState == other.isLoadingLocalState &&
          isSignInUserRegistered == other.isSignInUserRegistered &&
          isEntrantsViewItemsReverseSorted == other.isEntrantsViewItemsReverseSorted &&
          activeEntrantsSortOrder == other.activeEntrantsSortOrder &&
          player == other.player &&
          avatar == other.avatar &&
          basket == other.basket &&
          searchPreference == other.searchPreference &&
          activeSearchPreference == other.activeSearchPreference &&
          tournaments == other.tournaments &&
          searchTournaments == other.searchTournaments &&
          watchedTournaments == other.watchedTournaments &&
          enteredTournaments == other.enteredTournaments &&
          matchResultInfos == other.matchResultInfos &&
          rankingInfos == other.rankingInfos &&
          settings == other.settings &&
          registrationInfo == other.registrationInfo &&
          activeTab == other.activeTab;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, isSignedIn: $isSignedIn, isLoadingLocalState: $isLoadingLocalState, isSignedInUserRegistered: $isSignInUserRegistered, player: $player, avatar: $avatar, basket: $basket, searchQueryPreference: $searchPreference, registrationInfo: $registrationInfo, tournaments: $tournaments, searchTournaments: $searchTournaments, watchedTournaments: $watchedTournaments, enteredTournaments: $enteredTournaments, activeTab: $activeTab, isEntrantsViewItemsReverseSorted: $isEntrantsViewItemsReverseSorted, activeEntrantsSortOrder: $activeEntrantsSortOrder,  matchResultInfos: $matchResultInfos, rankingInfos:$rankingInfos, isEntrantsViewItemsReverseSorted: $isEntrantsViewItemsReverseSorted, settings: $settings}';
  }
}
