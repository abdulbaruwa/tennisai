import 'package:meta/meta.dart';
import 'models.dart';

@immutable
class AppState {
  final bool isLoading;
  final Player player;
  final AppTab activeTab;

  AppState(
      {this.isLoading = false, this.player, this.activeTab = AppTab.dashboard});

  factory AppState.loading() => new AppState(isLoading: true);

  AppState copyWith({bool isLoading, Player player, AppTab activeTab}) {
    return new AppState(
        isLoading: isLoading ?? this.isLoading,
        player: player ?? this.player,
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
          activeTab == other.activeTab;

  @override
  String toString() {
    return 'AppState{isLoading $isLoading, player:$player}';
  }
}
