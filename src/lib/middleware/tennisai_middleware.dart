import 'dart:async';
import 'package:redux/redux.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import '../models/models.dart';
import '../actions/actions.dart';
import '../keys/keys.dart';
import '../selectors/selectors.dart';
import '../repository/repository.dart';

Future<String> getAuthToken() {
  var flutterSecureStorage = new FlutterSecureStorage();
  return flutterSecureStorage.read(key: "authtoken");
}

List<Middleware<AppState>> createStoreWatchedTournamentsMiddleware([
  DashboardRepository repository = const DashboardRepository(
    webClient: const WebClient(TennisAiConfigs.localHostName, getAuthToken),
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
  final loadPlayerProfileFromServer = _loadPlayerProfileDirect(repository);
  final loadPlayerSettingsFromDevice = _loadPlayerSettingsFromDevice(repository);
  final savePlayerProfile = _createSavePlayerProfile(repository);

  final loadSearchQuery = _createLoadSearchPreference(repository);
  final saveSearchQuery = _createSaveSearchPreference(repository);

  final loadSearchTournaments = _createLoadSearchTournaments(repository);
  final saveSearchTournaments = _createSaveSearchTournaments(repository);
  final loadSearchTournamentsWithPreference =
      _createLoadSearchTournamentsWithPreference(repository);

  final loadBasket = _createLoadBasket(repository);
  final saveBasket = _createSaveBasket(repository);
  final sendToLtaBasket = _createSendBasketToLta(repository);
  final clearBasket = _createClearBasketAfterSendToLta(repository);

  final saveRankingInfos = _createSaveRankingInfos(repository);
  final saveMatchResultInfos = _createSaveMatchResultInfos(repository);
  final updateProfileAndSearchPref = _updatePlayerAndSearchProfile(repository);
  final changedAvatar = _changedAvatar(repository);

  final signInWithGoogleAction = _authCompleted(repository);
  final signInUserNotRegistered = _signInUserNotRegistered(repository);
  final checkSignInUserIsRegistered = _checkSignInUserIsRegistered(repository);
  final initStateAction = _initState(repository);
  final saveRegistrationInfoAction = _saveRegistrationInfo(repository);

  return [
    // Auth

    new TypedMiddleware<AppState, RegistrationSaveAction>(
        saveRegistrationInfoAction),
    new TypedMiddleware<AppState, InitStateAction>(initStateAction),
    new TypedMiddleware<AppState, SignInCompletedAction>(
        signInWithGoogleAction),
    new TypedMiddleware<AppState, SignInUserNotRegisteredAction>(
        signInUserNotRegistered),
    new TypedMiddleware<AppState, CheckSignInUserIsRegisteredAction>(
        checkSignInUserIsRegistered),
    new TypedMiddleware<AppState, LoadWatchedTournamentsAction>(
        loadWatchedTournaments),
    new TypedMiddleware<AppState, LoadUpcomingTournamentsAction>(
        loadUpcomingTournaments),
    new TypedMiddleware<AppState, AddWatchedTournamentsAction>(
        saveWatchedTournaments),
    new TypedMiddleware<AppState, WatchedTournamentsLoadedAction>(
        saveWatchedTournaments),
    new TypedMiddleware<AppState, LoadEnteredTournamentsAction>(
        loadEnteredTournaments),
    new TypedMiddleware<AppState, AddEnteredTournamentsAction>(
        saveEnteredTournaments),
    new TypedMiddleware<AppState, EnteredTournamentsLoadedAction>(
        saveEnteredTournaments),
    new TypedMiddleware<AppState, UpcomingTournamentsLoadedAction>(
        saveUpcomingTournaments),
    new TypedMiddleware<AppState, LoadRankingInfosAction>(loadRankingInfos),
    new TypedMiddleware<AppState, LoadMatchResultInfosAction>(
        loadMatchResultInfos),
    // new TypedMiddleware<AppSate, UpcomingTournamentsLoadedAction>(
    //   saveUpcomingTournaments),
    new TypedMiddleware<AppState, RemoveFromWatchedTournamentsAction>(
        saveWatchedTournaments),

    // Player Profile
    new TypedMiddleware<AppState, LoadPlayerAction>(loadPlayerProfile),
    new TypedMiddleware<AppState, LoadPlayerFromServerAction>(loadPlayerProfileFromServer),
    new TypedMiddleware<AppState, AddPlayerAction>(savePlayerProfile),
    new TypedMiddleware<AppState, LoadPlayerSettingsFromDeviceAction>(loadPlayerSettingsFromDevice),

    // Search Query preference
    new TypedMiddleware<AppState, LoadSearchPreferenceAction>(loadSearchQuery),
    new TypedMiddleware<AppState, AddSearchPreferenceAction>(saveSearchQuery),

    // Search Tournament
    new TypedMiddleware<AppState, LoadSearchTournamentsAction>(
        loadSearchTournaments),
    new TypedMiddleware<AppState, SearchTournamentWithPreferenceAction>(
        loadSearchTournamentsWithPreference),
    new TypedMiddleware<AppState, AddSearchTournamentsAction>(
        saveSearchTournaments),
    // Basket
    new TypedMiddleware<AppState, LoadBasketAction>(loadBasket),
    new TypedMiddleware<AppState, AddBasketAction>(saveBasket),
    new TypedMiddleware<AppState, AddTournamentToBasketAction>(saveBasket),
    new TypedMiddleware<AppState, RemoveTournamentFromBasketAction>(saveBasket),
    new TypedMiddleware<AppState, SendBasketToLtaBasketAction>(sendToLtaBasket),
    new TypedMiddleware<AppState, BasketSentToLtaAction>(clearBasket),

    // Edit profile
    new TypedMiddleware<AppState, UpdatePlayerProfileAndSearchPreferenceAction>(
        updateProfileAndSearchPref),

    // Main View, Match result and Ranking Info.
    new TypedMiddleware<AppState, RankingInfoLoadedAction>(saveRankingInfos),
    new TypedMiddleware<AppState, MatchResultInfo>(saveMatchResultInfos),
    new TypedMiddleware<AppState, ChangedAvatarAction>(changedAvatar)
  ];
}

Middleware<AppState> _signInUserNotRegistered(DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);
  };
}

Middleware<AppState> _saveRegistrationInfo(DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);
    var player = playerSelector(store.state);
    var authSettings = settingSelector(store.state).value;
    var registrationInfoToSave = registrationInfoSelector(store.state).value;
    Player playerToSave;
    if (player.isPresent == true) {
      playerToSave = player.value.copyWith(
          firstName: registrationInfoToSave.firstName,
          lastName: registrationInfoToSave.lastName,
          ltaNumber: registrationInfoToSave.btmNumber,
          email: authSettings.email);
    } else {
      playerToSave = new Player(
          firstName: registrationInfoToSave.firstName,
          lastName: registrationInfoToSave.lastName,
          ltaNumber: registrationInfoToSave.btmNumber,
          gender: registrationInfoToSave.gender, // TODO: to be  passed in via registrationInfo, will need modification to the registrationView.
          email: authSettings.email,
          usePublicProfileImage: true,
          profileImageUrl: authSettings.photoUrl,
          id: authSettings.playerId);
    }

    await repository.savePlayerProfile(playerToSave.toEntity());
    store.dispatch(new SignInUserIsRegisteredAction());
    store.dispatch(new PlayerLoadedAction(new List<Player>()..add(playerToSave)));
    store.dispatch(new InitStateAction(playerToSave.id));
  };
}

Middleware<AppState> _checkSignInUserIsRegistered(
    DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);
    var settings = action.settings as Settings;
    var playerProfile =
        await repository.loadLatestPlayerProfile(settings.playerId);

    if (playerProfile.isNotEmpty) {
      store.dispatch(new SignInUserIsRegisteredAction());
      store.dispatch(new PlayerLoadedAction(
          new List<Player>()..add(Player.fromEntity(playerProfile.first))));
      store.dispatch(new InitStateAction(settings.playerId));
    } else {
      store.dispatch(new SignInUserNotRegisteredAction(settings));
    }
  };
}

Middleware<AppState> _initState(DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    var playerId = action.playerId;

    store.dispatch(new LoadPlayerFromServerAction(playerId));
    store.dispatch(new LoadWatchedTournamentsAction());
    store.dispatch(new LoadUpcomingTournamentsAction());
    store.dispatch(new LoadBasketAction());
    store.dispatch(new LoadSearchPreferenceAction());
    store.dispatch(new LoadSearchTournamentsAction());
    store.dispatch(new LoadRankingInfosAction());
    store.dispatch(new LoadMatchResultInfosAction());
  };
}

Middleware<AppState> _authCompleted(DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);

    var settings = settingSelector(store.state);
    if (settings.isNotEmpty) {
      var playerSettings = settings.first;
      await repository.savePlayerSettings(playerSettings);
      await repository.saveAuthToken(playerSettings.azureAuthToken);
      store.dispatch(new CheckSignInUserIsRegisteredAction(settings.value));
    }
  };
}

Middleware<AppState> _changedAvatar(DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    print('Middleware._changedAvatar: About to temporary store avatar image');
    next(action);
  };
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

Middleware<AppState> _createClearBasketAfterSendToLta(
    DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    print(
        'Middleware._createClearBasketAfterSendToLta: About to clear basket repository');
    next(action);
    var toSave =
        basketSelector(store.state).map((basket) => basket.toEntity()).toList();
    repository.saveBasket(toSave.first);
  };
}

Middleware<AppState> _createLoadUpcomingTournaments(DashboardRepository repo) {
  var stateResult = (Store<AppState> store, action, NextDispatcher next) {
    var playerId = playerSelector(store.state).first?.id;
    repo.loadUpcomingTournaments(playerId).then((t) {
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
    var playerId = playerSelector(store.state).first?.id;
    repository.loadWatchedTournaments(playerId).then(
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
    var playerId = playerSelector(store.state).first?.id;
    repository.loadEnteredTournaments(playerId).then(
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

Middleware<AppState> _loadPlayerSettingsFromDevice(DashboardRepository repository){
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadPlayerSettingsFromDevice().then((playerSettings){
       if(playerSettings.isNotEmpty){
        store.dispatch(new SignInCompletedAction(playerSettings.first));
       }
       else{
         store.dispatch(new NoPlayerSettingsFoundOnDeviceAction());
       }
    });
    next(action);
  };
}

Middleware<AppState> _loadPlayerProfileDirect(DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadPlayerProfile(action.playerId).then(
      (player) {
        var entities = player.map(Player.fromEntity).toList();
        store.dispatch(
          new PlayerLoadedAction(entities),
        );
      },
    ).catchError((e) {
      print(e);
      store.dispatch(new PlayerNotLoadedAction());
    });
    next(action);
  };
}

Middleware<AppState> _createLoadPlayerProfile(DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    repository.loadPlayerProfile(action.playerId).then(
      (player) {
        var entities = player.map(Player.fromEntity).toList();
        store.dispatch(
          new PlayerLoadedAction(entities),
        );
      },
    ).catchError((e) {
      print(e);
      store.dispatch(new PlayerNotLoadedAction());
    });
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
    var playerId = playerSelector(store.state).first?.id;
    repository.loadSearchPreference(playerId).then(
      (searchPref) {
        var entities = searchPref.map(SearchPreference.fromEntity).toList();
        store.dispatch(
          new SearchPreferenceLoadedAction(entities),
        );
      },
    ).catchError((_) => store.dispatch(new SearchPreferenceNotLoadedAction()));
    next(action);
  };
}

Middleware<AppState> _createLoadSearchTournamentsWithPreference(
    DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) {
    var defaultGenderSetting =
        activeSearchPreferenceSelector(store.state).first?.gender;
    // Use the default Gender settings
    SearchPreference activeSearch = action.searchPreference;
    var searchPreference = activeSearch.copyWth(gender: defaultGenderSetting);

    repository.loadTournamentsWithSearchPreference(searchPreference).then(
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
    var playerId = playerSelector(store.state).first?.id;
    repository.loadSearchTournaments(playerId).then(
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
    var playerId = playerSelector(store.state).first?.id;
    repository.loadBasket(playerId).then(
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

Middleware<AppState> _createSendBasketToLta(DashboardRepository repository) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    print('About to send Basket to lta');
    next(action);
    var toSave = basketSelector(store.state).value.toEntity();
    await repository.saveToLtaBasket(toSave);
    store.dispatch(new BasketSentToLtaAction());
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
        if(searchPrefToSave.playerId == null || searchPrefToSave.playerId.isEmpty){
          searchPrefToSave.playerId = playerToSave.id;
        }
    repository.saveSearchPreference(searchPrefToSave);

    if (avatarSelector(store.state).isPresent) {
      repository.saveProfileAvatar(
          playerToSave.id, avatarSelector(store.state).value);
    }
  };
}

Middleware<AppState> _createLoadRankingInfos(DashboardRepository repo) {
  var stateResult = (Store<AppState> store, action, NextDispatcher next) {
    var playerId = playerSelector(store.state).first?.id;
    repo.loadRankingInfos(playerId).then((t) {
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
    var playerId = playerSelector(store.state).first?.id;
    repo.loadMatchResultInfos(playerId).then((t) {
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
