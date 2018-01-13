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

  final loadPlayerProfile = _createLoadPlayerProfile(repository);
  final savePlayerProfile = _createSavePlayerProfile(repository);

  final loadSearchQuery = _createLoadSearchPreference(repository);
  final saveSearchQuery = _createSaveSearchPreference(repository);

  final loadSearchTournaments = _createLoadSearchTournaments(repository);
  final saveSearchTournaments = _createSaveSearchTournaments(repository);

  return combineTypedMiddleware([
    new MiddlewareBinding<AppState, LoadWatchedTournamentsAction>(loadWatchedTournaments),
    new MiddlewareBinding<AppState, AddWatchedTournamentsAction>(saveWatchedTournaments),
    new MiddlewareBinding<AppState, AddWatchedTournamentsAction>(saveWatchedTournaments),
    new MiddlewareBinding<AppState, LoadEnteredTournamentsAction>(loadEnteredTournaments),
    new MiddlewareBinding<AppState, AddEnteredTournamentsAction>(saveEnterdTournaments),
    new MiddlewareBinding<AppState, EnteredTournamentsLoadedAction>(saveEnterdTournaments),

    // Player Profile
    new MiddlewareBinding<AppState, LoadPlayerAction>(loadPlayerProfile),
    new MiddlewareBinding<AppState, AddPlayerAction>(savePlayerProfile),

    // Search Query preference
    new MiddlewareBinding<AppState, LoadSearchPreferenceAction>(loadSearchQuery),
    new MiddlewareBinding<AppState, AddSearchPreferenceAction>(saveSearchQuery),

    // Search Tournament 
    new MiddlewareBinding<AppState, LoadSearchTournamentsAction>(loadSearchTournaments),
    new MiddlewareBinding<AppState, AddSearchTournamentsAction>(saveSearchTournaments),
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

// Player Profile
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
      (player) {
        var entities = player.map(Player.fromEntity).toList();
        store.dispatch(
          new PlayerLoadedAction(entities),
        );
      },
    ).catchError(
        (_) => store.dispatch(new PlayerNotLoadedAction()));
    next(action);
  };
}

// Player Profile
Middleware<AppState> _createSaveSearchPreference(
    DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    print('About to save search Query preference');
    next(action);
    var toSave = searchPreferenceSelector(store.state).value.toEntity();
       
    repository.saveSearchPreference(toSave);
  };
}

Middleware<AppState> _createLoadSearchPreference(
    DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadSearchPreference().then(
      (searchPref) {
        var entities = searchPref.map(SearchPreference.fromEntity).toList();
        store.dispatch(
          new SearchPreferenceLoadedAction(entities),
        );
      },
    ).catchError(
        (_) => store.dispatch(new SearchPreferenceNotLoadedAction()));
    next(action);
  };
}

// Search for Tournaments 
Middleware<AppState> _createSaveSearchTournaments(
    DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    print('About to save search Query preference');
    next(action);
      var toSave = searchTournamentsSelector(store.state)
        .map((watchedTournament) => watchedTournament.toEntity())
        .toList();
    repository.saveSearchTournaments(toSave);
  };
}

Middleware<AppState> _createLoadSearchTournaments(
    DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadSearchTournaments().then(
      (searchPref) {
        var entities = searchPref.map(Tournament.fromEntity).toList();
        store.dispatch(
          new SearchTournamentsLoadedAction(entities),
        );
      },
    ).catchError(
        (_) => store.dispatch(new SearchTournamentsNotLoadedAction()));
    next(action);
  };
}