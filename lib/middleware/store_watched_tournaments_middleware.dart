import 'package:redux/redux.dart';
import '../models/models.dart';
import '../actions/actions.dart';
import '../selectors/selectors.dart';
import '../repository/repository.dart';
import 'package:path_provider/path_provider.dart';

List<Middleware<AppState>> createStoreWatchedTournamentsMiddleware([
  WatchedTournamentsRepository repository = const WatchedTournamentsRepository(
    fileStorage:
        const FileStorage('Tennis_Ai_app_', getApplicationDocumentsDirectory),
  ),
]) {
  final loadWatchedTournaments = _createLoadWatchedTournaments(repository);
  final saveWatchedTournaments = _createSaveWatchedTournaments(repository);

  return combineTypedMiddleware([
    new MiddlewareBinding<AppState, LoadWatchedTournamentsAction>(loadWatchedTournaments),
    new MiddlewareBinding<AppState, AddWatchedTournamentsAction>(saveWatchedTournaments),
    new MiddlewareBinding<AppState, WatchedTournamentsLoadedAction>(saveWatchedTournaments),
  ]);
}

Middleware<AppState> _createSaveWatchedTournaments(
    WatchedTournamentsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    print('About to save');
    next(action);
    var toSave = watchedTournamentSelector(store.state)
        .map((watchedTournament) => watchedTournament.toEntity())
        .toList();
    print('To Save ${toSave.length}');
    repository.saveWatchedTournaments(toSave);
  };
}

Middleware<AppState> _createLoadWatchedTournaments(
    WatchedTournamentsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadWatchedTournaments().then(
      (watchedTournaments) {
        var entities = watchedTournaments.map(Tournament.fromEntity).toList();
        print('there ${watchedTournaments.length}');
        store.dispatch(
          new WatchedTournamentsLoadedAction(entities),
        );
      },
    ).catchError(
        (_) => store.dispatch(new WatchedTournamentsNotLoadedAction()));

    next(action);
  };
}
