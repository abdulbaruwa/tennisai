import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'models/models.dart';
import 'middleware/tennisai_middleware.dart';
import 'reducers/app_state_reducer.dart';
import 'routes.dart';
import 'actions/actions.dart';
import 'containers/app_loading.dart';
import 'views/loading_indicator.dart';
import 'containers/containers.dart';
import 'keys/keys.dart';

void main() => runApp(new TennisAiApp());

class TennisAiApp extends StatelessWidget {
  final store = new Store<AppState>(appReducer,
      initialState: new AppState.loading(),
      middleware: createStoreWatchedTournamentsMiddleware());

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
  store.dispatch(new LoadUpcomingTournamentsAction());
  // TODO playerId will need to be passed in via Auth and cache.
  store.dispatch(new LoadPlayerAction("12"));
  store.dispatch(new LoadBasketAction());
  store.dispatch(new LoadSearchPreferenceAction());
  store.dispatch(new LoadSearchTournamentsAction());
  store.dispatch(new LoadRankingInfosAction());
  store.dispatch(new LoadMatchResultInfosAction());
}

class TennisAiHome extends StatelessWidget {
  TennisAiHome() : super(key: TennisAiKeys.homeScreen);

    @override
  Widget build(BuildContext context) {
    return new AppLoading(builder: (context, loading) {
      return loading
          ? new LoadingIndicator(key: TennisAiKeys.homeTabLoading)
          : _buildView(context);
    });
  }

  Widget _buildView(BuildContext context) {
    return new ActiveTab(
      builder: (BuildContext context, AppTab activeTab) {
        return new Scaffold(
          body: _selectActiveTab(context, activeTab),
          bottomNavigationBar: new TabSelector(),
        );
      },
    );
  }
}

Widget _selectActiveTab(BuildContext context, AppTab tab) {
  print('Selected tab is ${describeEnum(tab)}');
  switch (tab) {
    case AppTab.home:
      return new MainTab();
      break;
    case AppTab.upcoming:
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
  const TabItem(title: 'Upcoming', icon: Icons.watch_later),
  const TabItem(title: 'Search', icon: Icons.search),
  const TabItem(title: 'Basket', icon: Icons.shopping_basket),
  const TabItem(title: 'Settings', icon: Icons.settings),
];
