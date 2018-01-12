import 'package:redux/redux.dart';
import '../models/models.dart';
import '../actions/actions.dart';
import '../selectors/selectors.dart';
import '../repository/repository.dart';
import 'package:path_provider/path_provider.dart';

List<Middleware<AppState>> createStoreProfileMiddleware([
  DashboardRepository repository = const DashboardRepository(
    fileStorage:
        const FileStorage('Tennis_Ai_app_', getApplicationDocumentsDirectory),
  ),
]) {
  final loadPlayerProfile = _createLoadPlayerProfile(repository);
  final savePlayerProfile = _createSavePlayerProfile(repository);


  return combineTypedMiddleware([
    new MiddlewareBinding<AppState, LoadPlayerAction>(loadPlayerProfile),
    new MiddlewareBinding<AppState, AddPlayerAction>(savePlayerProfile),
  ]);
}

Middleware<AppState> _createSavePlayerProfile(
    DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    print('About to save player profile');
    next(action);
    var toSave = playerSelector(store.state).value.toEntity();
       
    repository.savePlayerProfile(toSave);
  };
}

Middleware<AppState> _createLoadPlayerProfile(
    DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadPlayerProfile().then(
      (watchedTournaments) {
        var entities = watchedTournaments.map(Player.fromEntity).toList();
        store.dispatch(
          new PlayerLoadedAction(entities),
        );
      },
    ).catchError(
        (_) => store.dispatch(new PlayerNotLoadedAction()));
    next(action);
  };
}

