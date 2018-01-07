import 'package:meta/meta.dart';
import 'models.dart';

@immutable
class AppState {
  final bool isLoading;
  final Player player;

  AppState({this.isLoading = false, this.player});

  factory AppState.loading() => new AppState(isLoading: true);

  AppState copyWith({bool isLoading, Player player}) {
    return new AppState(
        isLoading: isLoading ?? this.isLoading, player: player ?? this.player);
  }

  @override
  int get hashCode => isLoading.hashCode ^ player.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          player == other.player;

  @override
  String toString(){return 'AppState{isLoading $isLoading, player:$player}';}
}
