import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'containers/auth/auth.dart';
import 'containers/auth/email_sign_up_container.dart';
import 'containers/auth/registration.dart';
import 'containers/auth/sign_in.dart';
import 'models/models.dart';
import 'middleware/tennisai_middleware.dart';
import 'reducers/app_state_reducer.dart';
import 'routes.dart';
import 'views/loading_indicator.dart';
import 'containers/containers.dart';
import 'keys/keys.dart';
import 'actions/actions.dart';

void main() => runApp(new TennisAiApp());

class TennisAiApp extends StatelessWidget {
  final store = new Store<AppState>(appReducer,
      initialState: new AppState.loading(),
      middleware: createStoreWatchedTournamentsMiddleware());

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: new MaterialApp(
          title: 'Tennis Ai',
          routes: {
            TennisAiRoutes.signIn: (BuildContext context) => new SignIn(),
            TennisAiRoutes.signUp: (BuildContext context) => new EmailSignUp(),
            TennisAiRoutes.registration: (BuildContext context) =>
                new Registration()
          },
          navigatorKey: TennisAiKeys.navKey,
          home: new StoreBuilder<AppState>(
              onInit: (store) => _loadState(store),
              builder: (context, store) {
                return new TennisAiHome();
              }),
        ));
  }
}

_loadState(Store store) {
  store.dispatch(new LoadPlayerSettingsFromDeviceAction());
}

class TennisAiHome extends StatelessWidget {
  TennisAiHome() : super(key: TennisAiKeys.homeScreen);

  @override
  Widget build(BuildContext context) {
    return new AppLoading(builder: (context, loading) {
      print('appLoading State: ${loading.isSignedIn}');
      if (loading.isSignedIn == false && loading.isLoadingLocalState == false) {
        print('Load AuthContainer');
        return new AuthContainer();
      }

      if (loading.isSignedIn &&
          loading.isLoadingLocalState &&
          loading.isRegisteredUser != PlayerRegistrationStatus.registered) {
        print('SHOW REGISTRATION VIEW');
        return new Registration();
      }

      if (loading.isRegisteredUser == PlayerRegistrationStatus.registered) {
        return loading.isLoading &&
                loading.isLoadingLocalState &&
                loading.isSignedIn
            ? new LoadingIndicator(key: TennisAiKeys.homeTabLoading)
            : _buildView(context);
      }
      return new LoadingIndicator(key: TennisAiKeys.homeTabLoading);
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
      return new Container(child: new TournamentSearch());
      break;
    case AppTab.profile:
      return new Profile();
      break;
    default:
      return new Container(child: const Text('Unknown tab'));
  }
}

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
