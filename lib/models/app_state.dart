import 'package:meta/meta.dart';
import 'models.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<Player> player;
  final AppTab activeTab;
  final List<Tournament> enteredTournaments;
  final List<Tournament> watchedTournaments;

  AppState(
      {this.isLoading = false, this.player = const[], this.enteredTournaments = const[], this.watchedTournaments = const [], this.activeTab = AppTab.dashboard});

  factory AppState.loading() => new AppState(isLoading: true);

  AppState copyWith({bool isLoading, List<Player> player, List<Tournament> enteredTournaments, List<Tournament> watchedTournaments, AppTab activeTab}) {
    print('CopyWith');
    return new AppState(
        isLoading: isLoading ?? this.isLoading,
        player: player ?? this.player,
        watchedTournaments: watchedTournaments ?? this.watchedTournaments,
        enteredTournaments: enteredTournaments ?? this.enteredTournaments,
        activeTab: activeTab ?? this.activeTab);
  }

  @override
  int get hashCode => isLoading.hashCode ^ player.hashCode ^ activeTab.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          player == other.player &&
          watchedTournaments == other.watchedTournaments &&
          enteredTournaments == other.enteredTournaments &&
          activeTab == other.activeTab;

  @override
  String toString() {
    print('toString');
    return 'AppState{isLoading: $isLoading, player: $player, watchedTournaments: $watchedTournaments, enteredTournaments: $enteredTournaments, activeTab: $activeTab}';
  }
}
