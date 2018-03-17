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
  final loadUpcomingTournaments = _createLoadUpcomingTournaments(repository);
  final loadWatchedTournaments = _createLoadWatchedTournaments(repository);
  final saveWatchedTournaments = _createSaveWatchedTournaments(repository);

  final loadRankingInfos = _createLoadRankingInfos(repository);
  final loadMatchResultInfos = _createLoadMatchResultInfos(repository);

  final loadEnteredTournaments = _createLoadEnteredTournaments(repository);
  final saveEnteredTournaments = _createSaveEnteredTournaments(repository);
  final saveUpcomingTournaments = _createSaveUpcomingTournaments(repository);

  final loadPlayerProfile = _createLoadPlayerProfile(repository);
  final savePlayerProfile = _createSavePlayerProfile(repository);

  final loadSearchQuery = _createLoadSearchPreference(repository);
  final saveSearchQuery = _createSaveSearchPreference(repository);

  final loadSearchTournaments = _createLoadSearchTournaments(repository);
  final saveSearchTournaments = _createSaveSearchTournaments(repository);
  final loadSearchTournamentsWithPreference =
      _createLoadSearchTournamentsWithPreference(repository);

  final loadBasket = _createLoadBasket(repository);
  final saveBasket = _createSaveBasket(repository);

  final saveRankingInfos = _createSaveRankingInfos(repository);
  final saveMatchResultInfos = _createSaveMatchResultInfos(repository);
  final updateProfileAndSearchPref = _updatePlayerAndSearchProfile(repository);

  return combineTypedMiddleware([
    new MiddlewareBinding<AppState, LoadWatchedTournamentsAction>(
        loadWatchedTournaments),
    new MiddlewareBinding<AppState, LoadUpcomingTournamentsAction>(
        loadUpcomingTournaments),
    new MiddlewareBinding<AppState, AddWatchedTournamentsAction>(
        saveWatchedTournaments),
    new MiddlewareBinding<AppState, WatchedTournamentsLoadedAction>(
        saveWatchedTournaments),
    new MiddlewareBinding<AppState, LoadEnteredTournamentsAction>(
        loadEnteredTournaments),
    new MiddlewareBinding<AppState, AddEnteredTournamentsAction>(
        saveEnteredTournaments),
    new MiddlewareBinding<AppState, EnteredTournamentsLoadedAction>(
        saveEnteredTournaments),
    new MiddlewareBinding<AppState, UpcomingTournamentsLoadedAction>(
        saveUpcomingTournaments),
    new MiddlewareBinding<AppState, LoadRankingInfosAction>(loadRankingInfos),
    new MiddlewareBinding<AppState, LoadMatchResultInfosAction>(
        loadMatchResultInfos),
    // new MiddlewareBinding<AppSate, UpcomingTournamentsLoadedAction>(
    //   saveUpcomingTournaments),
    new MiddlewareBinding<AppState, RemoveFromWatchedTournamentsAction>(
        saveWatchedTournaments),

    // Player Profile
    new MiddlewareBinding<AppState, LoadPlayerAction>(loadPlayerProfile),
    new MiddlewareBinding<AppState, AddPlayerAction>(savePlayerProfile),

    // Search Query preference
    new MiddlewareBinding<AppState, LoadSearchPreferenceAction>(
        loadSearchQuery),
    new MiddlewareBinding<AppState, AddSearchPreferenceAction>(saveSearchQuery),

    // Search Tournament
    new MiddlewareBinding<AppState, LoadSearchTournamentsAction>(
        loadSearchTournaments),
    new MiddlewareBinding<AppState, SearchTournamentWithPreferenceAction>(loadSearchTournamentsWithPreference),
    new MiddlewareBinding<AppState, AddSearchTournamentsAction>(
        saveSearchTournaments),
    // Basket
    new MiddlewareBinding<AppState, LoadBasketAction>(loadBasket),
    new MiddlewareBinding<AppState, AddBasketAction>(saveBasket),
    new MiddlewareBinding<AppState, AddTournamentToBasketAction>(saveBasket),
    new MiddlewareBinding<AppState, RemoveTournamentFromBasketAction>(
        saveBasket),

    // Edit profile
    new MiddlewareBinding<AppState,
            UpdatePlayerProfileAndSearchPreferenceAction>(
        updateProfileAndSearchPref),

    // Main View, Match result and Ranking Info.
    new MiddlewareBinding<AppState, RankingInfoLoadedAction>(saveRankingInfos),
    new MiddlewareBinding<AppState, MatchResultInfo>(saveMatchResultInfos)
  ]);
}

Middleware<AppState> _createSaveWatchedTournaments(
    DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    print(
        'Middleware._createSaveWatchedTournaments: About to save watched Tournaments');
    next(action);
    var toSave = watchedTournamentSelector(store.state)
        .map((watchedTournament) => watchedTournament.toEntity())
        .toList();
    print(
        'Middleware._createSaveWatchedTournaments: Saved ${toSave.length} Watched tournament');
    repository.saveWatchedTournaments(toSave);
  };
}

Middleware<AppState> _createLoadUpcomingTournaments(DashboardRepository repo) {
  var stateResult = (Store<AppState> store, action, NextDispatcher next) {
    repo.loadUpcomingTournaments().then((t) {
      var upComingTournament = t.map(Tournament.fromEntity).toList();
      print(
          'Middleware ._createLoadWatchedTournaments: Loading ${upComingTournament.length} Watched tournament');
      store.dispatch(
        new UpcomingTournamentsLoadedAction(upComingTournament),
      );
    });
  };
  return stateResult;
}

Middleware<AppState> _createSaveUpcomingTournaments(
    DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    print(
        'Middleware._createSaveUpcomingTournaments: About to save entered tournament');
    next(action);
    var toSave = upcomingTournamentSelector(store.state)
        .map((upcomingTournament) => upcomingTournament.toEntity())
        .toList();
    print(
        'Middleware._createSaveUpcomingTournaments: Saved ${toSave.length} Entered tournament');
    repository.saveEnteredTournaments(toSave);
  };
}

Middleware<AppState> _createLoadWatchedTournaments(
    DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadWatchedTournaments().then(
      (watchedTournaments) {
        var entities = watchedTournaments.map(Tournament.fromEntity).toList();
        print(
            'Middleware ._createLoadWatchedTournaments: Loading ${entities.length} Watched tournament');
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
    print(
        'Middleware._createSaveEnteredTournaments: About to save entered tournament');
    next(action);
    var toSave = enteredTournamentSelector(store.state)
        .map((enteredTournament) => enteredTournament.toEntity())
        .toList();
    print(
        'Middleware._createSaveEnteredTournaments: Saved ${toSave.length} Entered tournament');
    repository.saveEnteredTournaments(toSave);
  };
}

Middleware<AppState> _createLoadEnteredTournaments(
    DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadEnteredTournaments().then(
      (enteredTournaments) {
        var entities = enteredTournaments.map(Tournament.fromEntity).toList();
        print(
            'Middleware._createLoadEnteredTournaments: returned ${enteredTournaments.length}');
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
Middleware<AppState> _createSavePlayerProfile(DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    print('About to save player profile');
    next(action);
    var toSave = playerSelector(store.state).value.toEntity();

    repository.savePlayerProfile(toSave);
  };
}

Middleware<AppState> _createLoadPlayerProfile(DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadPlayerProfile().then(
      (player) {
        var entities = player.map(Player.fromEntity).toList();
        store.dispatch(
          new PlayerLoadedAction(entities),
        );
      },
    ).catchError((_) => store.dispatch(new PlayerNotLoadedAction()));
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

Middleware<AppState> _createLoadSearchPreference(DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadSearchPreference().then(
      (searchPref) {
        var entities = searchPref.map(SearchPreference.fromEntity).toList();
        store.dispatch(new SearchPreferenceLoadedAction(entities),
        );
      },
    ).catchError((_) => store.dispatch(new SearchPreferenceNotLoadedAction()));
    next(action);
  };
}

// Middleware<AppState> _createLoadSearchTournamentsWithPreference (DashboardRepository repository){
//   return (Store<AppState> store, action, NextDispatcher next){
//     repository.loadTournamentsWithSearchPreference(action).then((tournaments){}).
//   };
// }

Middleware<AppState> _createLoadSearchTournamentsWithPreference(
    DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    var searchPreference = activeSearchPreferenceSelector(store.state);
    repository.loadTournamentsWithSearchPreference(action.searchPreference.first).then(
      (searchPref) {
        var entities = searchPref.map(Tournament.fromEntity).toList();
        store.dispatch(
          new SearchTournamentsLoadedAction(entities),
        );
      },
    ).catchError((_) => store.dispatch(new SearchTournamentsNotLoadedAction()));
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
        .map((search) => search.toEntity())
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
    ).catchError((_) => store.dispatch(new SearchTournamentsNotLoadedAction()));
    next(action);
  };
}

// Basket
Middleware<AppState> _createLoadBasket(DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadBasket().then(
      (basket) {
        var entities = basket.map(Basket.fromEntity).toList();
        store.dispatch(
          new BasketLoadedAction(entities),
        );
      },
    ).catchError((_) => store.dispatch(new BasketNotLoadedAction()));
    next(action);
  };
}

Middleware<AppState> _createSaveBasket(DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    print('About to save Basket');
    next(action);
    var toSave = basketSelector(store.state).value.toEntity();
    repository.saveBasket(toSave);
  };
}

Middleware<AppState> _updatePlayerAndSearchProfile(
    DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    print('About to save player profile and search pref');
    next(action);
    var playerToSave = playerSelector(store.state).value.toEntity();
    repository.savePlayerProfile(playerToSave);

    var searchPrefToSave =
        searchPreferenceSelector(store.state).value.toEntity();
    repository.saveSearchPreference(searchPrefToSave);
  };
}

Middleware<AppState> _createLoadRankingInfos(DashboardRepository repo) {
  var stateResult = (Store<AppState> store, action, NextDispatcher next) {
    repo.loadRankingInfos().then((t) {
      var rankingInfo = t.map(RankingInfo.fromEntity).toList();
      print(
          'Middleware ._createLoadRankingInfos: Loading ${rankingInfo.length} Ranking Info');
      store.dispatch(
        new RankingInfoLoadedAction(rankingInfo),
      );
    });
  };
  return stateResult;
}

Middleware<AppState> _createLoadMatchResultInfos(DashboardRepository repo) {
  var stateResult = (Store<AppState> store, action, NextDispatcher next) {
    repo.loadMatchResultInfos().then((t) {
      var rankingInfos = t.map(MatchResultInfo.fromEntity).toList();
      print(
          'Middleware ._createLoadRankingInfos: Loading ${rankingInfos.length} Ranking Info');
      store.dispatch(
        new MatchResultInfoLoadedAction(rankingInfos),
      );
    });
  };
  return stateResult;
}

Middleware<AppState> _createSaveRankingInfos(DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    print('Middleware._createSaveRankingInfos: About to save ranking info');
    next(action);
    var toSave = rankingInfosSelector(store.state)
        .map((enteredTournament) => enteredTournament.toEntity())
        .toList();
    print(
        'Middleware._createSaveEnteredTournaments: Saved ${toSave.length} Entered tournament');
    repository.saveRankingInfos(toSave);
  };
}

Middleware<AppState> _createSaveMatchResultInfos(
    DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    print(
        'Middleware._createSaveMatchResultInfos: About to save Match result info');
    next(action);
    var toSave = matchResultInfosSelector(store.state)
        .map((matchResultInfo) => matchResultInfo.toEntity())
        .toList();
    print(
        'Middleware._createSaveMatchResultIfnos: Saved ${toSave.length} Match results');
    repository.saveMatchResultInfos(toSave);
  };
}
