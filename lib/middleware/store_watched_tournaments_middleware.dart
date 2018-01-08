import 'package:redux/redux.dart';
import '../models/models.dart';
import '../actions/actions.dart';
import '../selectors/selectors.dart';
import '../repository/repository.dart';
import 'package:path_provider/path_provider.dart';

List<Middleware<AppState>> createStoreWatchedTournamentsMiddleware([
WatchedTournamentsRepository repository = const WatchedTournamentsRepository(fileStorage: const FileStorage('Tennis_Ai_app_', getApplicationDocumentsDirectory),),

]){

  final loadWatchedTournaments = _createLoadWatchedTournaments(repository);
  final saveWatchedTournaments = _createSaveWatchedTournaments(repository);

  return combineTypedMiddleware(
    [new MiddlewareBinding<AppState, LoadWatchedTournamentsAction>(loadWatchedTournaments),
    new MiddlewareBinding<AppState, AddWatchedTournamentsAction>(saveWatchedTournaments),
    ]
  );
}

Middleware<AppState> _createSaveWatchedTournaments(WatchedTournamentsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    repository.saveWatchedTournaments(
      watchedTournamentSelector(store.state).map((watchedTournament) => watchedTournament.toEntity()).toList(),
    );
  };
}

Middleware<AppState> _createLoadWatchedTournaments(WatchedTournamentsRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadWatchedTournaments().then(
      (watchedTournaments) {
        store.dispatch(
          new WatchedTournamentsLoadedAction(
            watchedTournaments.map(Tournament.fromEntity).toList(),
          ),
        );
      },
    ).catchError((_) => store.dispatch(new WatchedTournamentsNotLoadedAction()));

    next(action);
  };
}
