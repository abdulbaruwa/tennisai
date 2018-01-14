import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'models/models.dart';
import 'reducers/app_state_reducer.dart';
import 'actions/actions.dart';
import 'routes.dart';
import 'keys/keys.dart';
import 'containers/containers.dart';
import './middleware/store_watched_tournaments_middleware.dart';

int counterReducer(int state, action) {
  if (action == Actions.Increment) {
    return state + 1;
  }

  return state;
}

class TennisAiApp extends StatelessWidget {
  final store = new Store<AppState>(appReducer,
      initialState: new AppState.loading(),
      middleware: createStoreWatchedTournamentsMiddleware());
  //final store = new Store(counterReducer, initialState: 0);
  TennisAiApp();

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        //   theme: new ThemeData.dark(),
        child: new MaterialApp(
            title: 'Tennis Ai',
            // Pass the store to the StoreProvider. Any ancestor `StoreConnector`
            // Widgets will find and use this value as the `Store`.
            routes: {TennisAiRoutes.about: (context) {}},
            home: new StoreBuilder<AppState>(
                onInit: (store) => _loadState(store),
                builder: (context, store) {
                  return new TennisAiHome();
                })));
  }
}

_loadState(Store store) {
  store.dispatch(new LoadWatchedTournamentsAction());
  store.dispatch(new LoadPlayerAction());
  store.dispatch(new LoadBasketAction());
  store.dispatch(new LoadSearchPreferenceAction());
  store.dispatch(new LoadSearchTournamentsAction());
}

class TennisAiHome extends StatelessWidget {
  TennisAiHome() : super(key: TennisAiKeys.homeScreen);

  @override
  Widget build(BuildContext context) {
    return new ActiveTab(
      builder: (BuildContext context, AppTab activeTab) {
        return new Scaffold(
          // appBar: new AppBar(
          //   //title: new Text(TennisAiLocalizations.of(context).appTitle),
          //   title: new Text('Tennis Ai'),
          // ),
          body: _selectActiveTab(context, activeTab),
          floatingActionButton: activeTab == AppTab.profile
              ? new FloatingActionButton(
                  key: TennisAiKeys.editProfile,
                  onPressed: () {
                    Navigator.pushNamed(context, TennisAiRoutes.editProfile);
                  },
                  child: new Icon(Icons.add),
                  tooltip: 'Edit Profile')
              : new Container(),
          bottomNavigationBar: new TabSelector(),
        );
      },
    );
  }
}

Widget _selectActiveTab(BuildContext context, AppTab tab) {
  print('Selected tab is ${describeEnum(tab)}');
  switch (tab) {
    case AppTab.dashboard:
      return new Dashboard();
      break;
    case AppTab.basket:
      return new BasketContainer();
      break;
    case AppTab.search:
      print('About to load Search tab.');
      return new Container(
        child: new TournamentSearch()
      );
      break;
    case AppTab.profile:
      return new Profile();
      break;
    default:
      return new Container(child: const Text('Unknown tab'));
  }
}

enum Actions { Increment }

class TabItem {
  const TabItem({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<TabItem> TabItems = const <TabItem>[
  const TabItem(title: 'Home', icon: Icons.home),
  const TabItem(title: 'Tournaments', icon: Icons.search),
  const TabItem(title: 'Basket', icon: Icons.shopping_basket),
  const TabItem(title: 'Settings', icon: Icons.settings),
];
