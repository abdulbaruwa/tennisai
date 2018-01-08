import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'models/models.dart';
import 'reducers/app_state_reducer.dart';
import 'actions/actions.dart';
import 'routes.dart';
import 'keys/keys.dart';
import 'containers/containers.dart';
import 'localization.dart';

class TennisAiApp extends StatelessWidget {
  final store =
      new Store<AppState>(appReducer, initialState: new AppState.loading());
  TennisAiApp();

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: new MaterialApp(
            title: 'Tennis Ai',
            theme: new ThemeData(
                primarySwatch: Colors.indigo, backgroundColor: Colors.white),
            routes: {
              TennisAiRoutes.home: (context) {
                new StoreBuilder<AppState>(
                  onInit: (store) => store.dispatch(new LoadPlayerAction()),
                  builder: (context, store) {
                    return new TennisAiHome();
                  },
                );
              }
            }));
  }
}

class TennisAiHome extends StatelessWidget{
  TennisAiHome() : super(key: TennisAiKeys.homeScreen);

  @override
  Widget build(BuildContext context) {
    return new ActiveTab(
      builder: (BuildContext context, AppTab activeTab) {
        return new Scaffold(
          appBar: new AppBar(
            title: new Text(TennisAiLocalizations.of(context).appTitle),
         
          ),
          body: new Dashboard(),
          floatingActionButton:activeTab == AppTab.settings ?  new FloatingActionButton(
            key: TennisAiKeys.editProfile,
            onPressed: () {
              Navigator.pushNamed(context, TennisAiRoutes.editProfile);
            },
            child: new Icon(Icons.add),
            tooltip: 'Edit Profile' 
          ) : new Container(),
          bottomNavigationBar: new TabSelector(),
        );
      },
    );
  }
}


class TennisAiHom extends StatelessWidget{

  PageController _tabController;
  var _title_app = null;
  int _tab = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   var tours = new _services.TennisAiServices().GetPlayer('12');
  //   _tabController = new PageController();
  //   this._title_app = TabItems[0].title;
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _tabController.dispose();
  // }

  @override
  Widget build(BuildContext buildcontext) => new Scaffold(
      body: new PageView(
        controller: _tabController,
        onPageChanged: onTabChanged,
        children: <Widget>[

        ],
      ),

      // Tabs
      bottomNavigationBar: Theme.of(buildcontext).platform == TargetPlatform.iOS
          ? new CupertinoTabBar(
              activeColor: Colors.blueGrey,
              currentIndex: _tab,
              onTap: onTap,
              items: TabItems.map((TabItem) {
                return new BottomNavigationBarItem(
                  title: new Text(TabItem.title),
                  icon: new Icon(TabItem.icon),
                );
              }).toList(),
            )
          : new BottomNavigationBar(
              currentIndex: _tab,
              onTap: onTap,
              type: BottomNavigationBarType.shifting,
              items: TabItems.map((TabItem) {
                return new BottomNavigationBarItem(
                    title: new Text(TabItem.title, style: new TextStyle(color: Colors.black),),
                    icon: new Icon(TabItem.icon, color: Colors.black,));
              }).toList(),
            ),

   
      );
  void onTap(int tab) {
    _tabController.jumpToPage(tab);
  }

   void onTabChanged(int tab) {
    
  //     this._tab = tab;
    
  //   switch (tab) {
  //     case 0:
  //       this._title_app = TabItems[0].title;
  //       break;
  //     case 1:
  //       this._title_app = TabItems[1].title;
  //       break;
  //     case 2:
  //       this._title_app = TabItems[2].title;
  //       break;
  //     case 3:
  //       this._title_app = TabItems[3].title;
  //       break;
  //   }
   }
}

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