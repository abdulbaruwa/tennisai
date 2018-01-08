import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './tabs/landingHome.dart' as _firstTab;
import './tabs/dashboard.dart' as _secondTab;
import './tabs/settings.dart' as _thirdTab;
import './tabs/search.dart' as _forthTab;
import './pages/about.dart' as _aboutPage;
import './pages/support.dart' as _supportPage;
import './services/tournamentServices.dart' as _services;


void main() => runApp(new MaterialApp(
      title: 'Tennis Ai',
      theme: new ThemeData(
           primarySwatch: Colors.indigo,
          scaffoldBackgroundColor: Colors.white,
           //primaryColor: Colors.indigo,
          backgroundColor: Colors.white),
      home: new Tabs(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/about':
            return new FromRightToLeft(
              builder: (_) => new _aboutPage.About(),
              settings: settings,
            );
          case '/support':
            return new FromRightToLeft(
                builder: (_) => new _supportPage.Support(), settings: settings);
        }
      },
    ));

// class TennisAiApp extends StatelessWidget{final store = new Store<AppState>(appReducer,initialState: new AppState.loading(),middleWare: createTennisAiMiddleWare())};
class FromRightToLeft<T> extends MaterialPageRoute<T>{
  FromRightToLeft({WidgetBuilder builder, RouteSettings settings}) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context,
  Animation<double> animation, Animation<double> secondaryAnimation,
  Widget child){
    if(settings.isInitialRoute) return child;

    return new SlideTransition(child: new Container(
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black26,
              blurRadius: 25.0,
            )
          ]
        ),
        child: child,
      ),
    position: new FractionalOffsetTween(
      begin: const FractionalOffset(1.0, 1.0),
      end: FractionalOffset.topLeft
      )
      .animate(
        new CurvedAnimation(
          parent: animation, 
          curve: Curves.fastOutSlowIn)),);

    @override 
    Duration get transitionDuration => const Duration(milliseconds: 400);
  }
}

class Tabs extends StatefulWidget {
  @override
  TabsState createState() => new TabsState();
}

class TabsState extends State<Tabs> {
  PageController _tabController;
  var _title_app = null;
  int _tab = 0;

  @override
  void initState() {
    super.initState();
    var tours = new _services.TennisAiServices().GetPlayer('12');
    _tabController = new PageController();
    this._title_app = TabItems[0].title;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext buildcontext) => new Scaffold(
      body: new PageView(
        controller: _tabController,
        onPageChanged: onTabChanged,
        children: <Widget>[
          new  _firstTab.LandingHome(),
          new _forthTab.SearchTab(),
          new _secondTab.Dashboard(),
          new _thirdTab.SettingsTab(),
        ],
      ),

      // Tabs
      bottomNavigationBar: Theme.of(context).platform == TargetPlatform.iOS
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

      //Drawer
      drawer: new Drawer(
          child: new ListView(
        children: <Widget>[
          new Container(
            height: 120.0,
            child: new DrawerHeader(
              padding: new EdgeInsets.all(0.0),
              decoration: new BoxDecoration(
                color: new Color(0xFFECEFF1),
              ),
              child: new Center(
                child: new FlutterLogo(
                  colors: Colors.blueGrey,
                  size: 54.0,
                ),
              ),
            ),
          ),
          new ListTile(
              leading: new Icon(Icons.chat),
              title: new Text('Support'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/support');
              }),
          new ListTile(
              leading: new Icon(Icons.info),
              title: new Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/about');
              }),
          new Divider(),
          new ListTile(
              leading: new Icon(Icons.exit_to_app),
              title: new Text('Sign Out'),
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      )));
  void onTap(int tab) {
    _tabController.jumpToPage(tab);
  }

  void onTabChanged(int tab) {
    setState(() {
      this._tab = tab;
    });
    switch (tab) {
      case 0:
        this._title_app = TabItems[0].title;
        break;
      case 1:
        this._title_app = TabItems[1].title;
        break;
      case 2:
        this._title_app = TabItems[2].title;
        break;
      case 3:
        this._title_app = TabItems[3].title;
        break;
    }
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
