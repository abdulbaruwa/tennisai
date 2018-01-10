import 'package:redux/redux.dart';
import '../models/models.dart';
import '../actions/actions.dart';
import '../selectors/selectors.dart';
import '../repository/repository.dart';
import 'package:path_provider/path_provider.dart';

List<Middleware<AppState>> createStoreWatchedTournamentsMiddleware([
  DashboardRepository repository = const DashboardRepository(
    fileStorage:
        const FileStorage('Tennis_Ai_app_', getApplicationDocumentsDirectory),
  ),
]) {
  final loadWatchedTournaments = _createLoadWatchedTournaments(repository);
  final saveWatchedTournaments = _createSaveWatchedTournaments(repository);

  final loadEnteredTournaments = _createLoadEnteredTournaments(repository);
  final saveEnterdTournaments = _createSaveEnteredTournaments(repository);

  return combineTypedMiddleware([
    new MiddlewareBinding<AppState, LoadWatchedTournamentsAction>(loadWatchedTournaments),
    new MiddlewareBinding<AppState, AddWatchedTournamentsAction>(saveWatchedTournaments),
    new MiddlewareBinding<AppState, AddWatchedTournamentsAction>(saveWatchedTournaments),
    new MiddlewareBinding<AppState, LoadEnteredTournamentsAction>(loadEnteredTournaments),
    new MiddlewareBinding<AppState, AddEnteredTournamentsAction>(saveEnterdTournaments),
    new MiddlewareBinding<AppState, EnteredTournamentsLoadedAction>(saveEnterdTournaments),
  ]);
}

Middleware<AppState> _createSaveWatchedTournaments(
    DashboardRepository repository) {
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
    DashboardRepository repository) {
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

Middleware<AppState> _createSaveEnteredTournaments(
    DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    print('About to save entered tournament');
    next(action);
    var toSave = enteredTournamentSelector(store.state)
        .map((enteredTournament) => enteredTournament.toEntity())
        .toList();
    print('To Save ${toSave.length}');
    repository.saveWatchedTournaments(toSave);
  };
}

Middleware<AppState> _createLoadEnteredTournaments(
    DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadEnteredTournaments().then(
      (enteredTournaments) {
        var entities = enteredTournaments.map(Tournament.fromEntity).toList();
        print('there ${enteredTournaments.length}');
        store.dispatch(
          new EnteredTournamentsLoadedAction(entities),
        );
      },
    ).catchError(
        (_) => store.dispatch(new EnteredTournamentsNotLoadedAction()));
    next(action);
  };
}
