import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/tournament.dart';
import '../models/tournament.dart' as _tournamentModels;
import '../pages/touranmentDetails.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Landing();
}

//const double _kAppBarHeight = 128.0;
const double _kAppBarHeight = 128.0;
const double _kFabHalfSize =
    28.0; // TODO(mpcomplete): needs to adapt to screen size
const double _kRecipePageMaxWidth = 500.0;
final DateFormat _dateFormatter = new DateFormat.MEd('en_UK');

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.redAccent,
  //  platform: Theme.of(context).platform
);

class PestoStyle extends TextStyle {
  const PestoStyle({
    double fontSize: 12.0,
    FontWeight fontWeight,
    Color color: Colors.black87,
    double letterSpacing,
    double height,
  })
      : super(
          inherit: false,
          color: color,
          fontFamily: 'Raleway',
          fontSize: fontSize,
          fontWeight: fontWeight,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: letterSpacing,
          height: height,
        );
}

class SimpleHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
          new Icon(Icons.home, size: 150.0, color: Colors.black12),
          new Text('Home tab contect')
        ]));
  }
}

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var values = _tournamentModels.tournaments;
    return new TournamentGridPage(tournaments: values);
  }
}

// To display a grid of tournaments cards.
class TournamentGridPage extends StatefulWidget {
  const TournamentGridPage({Key key, this.tournaments}) : super(key: key);
  final List<Tournament> tournaments;
  @override
  _TournamentGridPageState createState() => new _TournamentGridPageState();
}

class _TournamentGridPageState extends State<TournamentGridPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  AnimationController _controller;

  static const List<IconData> icons = const [
    Icons.sms,
    Icons.mail,
    Icons.phone
  ];

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).cardColor;
    Color foregroundColor = Theme.of(context).accentColor;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return new Theme(
        data: _kTheme.copyWith(platform: Theme.of(context).platform),
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text(
              'Home',
              style: new TextStyle(
                fontSize: Theme.of(context).platform == TargetPlatform.iOS
                    ? 17.0
                    : 20.0,
              ),
            ),
            elevation:
                Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
          ),
          key: scaffoldKey,
          body: new CustomScrollView(
            slivers: <Widget>[
              _buildBody(context, statusBarHeight),
            ],
          ),
        ));
  }

  Widget _buildBody(BuildContext context, double statusBarHeight) {
    final EdgeInsets padding = const EdgeInsets.all(8.0);
    return new SliverPadding(
      padding: padding,
      sliver: new SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //maxCrossAxisExtent: _kRecipePageMaxWidth,
          crossAxisCount: 1,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
          childAspectRatio: 2.0,
        ),
        delegate: new SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final Tournament tournament = widget.tournaments[index];
            // return new Text(tournament.name) ;
            return new TournamentCard(
              tournament: tournament,
              onTap: () {
                showTournamentDetailsPage(context, tournament);
              },
            );
          },
          childCount: widget.tournaments.length,
        ),
      ),
    );
  }
}

void showTournamentDetailsPage(BuildContext context, Tournament tournament) {
  Navigator.push(
      context,
      new MaterialPageRoute<Null>(
        settings: const RouteSettings(name: '/tournament/details'),
        builder: (BuildContext context) {
          return new Theme(
            data: _kTheme.copyWith(platform: Theme.of(context).platform),
            child: new TournamentDetailsPage(tournament: tournament),
          );
        },
      ));
}

// A card to display tournament details
class TournamentCard extends StatelessWidget {
  final TextStyle titleStyle =
      const PestoStyle(fontSize: 24.0, fontWeight: FontWeight.w600);
  final TextStyle authorStyle =
      const PestoStyle(fontWeight: FontWeight.w500, color: Colors.black54);
  const TournamentCard({Key key, this.tournament, this.onTap})
      : super(key: key);

  final Tournament tournament;
  final VoidCallback onTap;
//  String tournamentDate;
  @override
  Widget build(BuildContext context) {
    //return new GestureDetector(
    var tournamentDate =
        "${new DateFormat("yMMMEd").format(tournament.startDate)} to ${ new DateFormat("yMMMEd").format(tournament.endDate)}";
    return new GestureDetector(
      onTap: onTap,
      child: new Card(
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              child: new ListTile(
                leading: const Icon(
                    const IconData(0xe091, fontFamily: 'MaterialIcons')),
                title: new Text(tournament.name),
                subtitle: new Text(tournament.location),
              ),
              padding: const EdgeInsets.only(
                  left: 1.0, right: 1.0, top: 1.0, bottom: 1.0),
            ),
            new Padding(
              child: new Text(
                tournamentDate,
                textAlign: TextAlign.left,
                textScaleFactor: 1.0,
                style: authorStyle,
              ),
              padding: const EdgeInsets.only(left: 10.0),
            ),
            new SizedBox(
              height: 30.0,
            ),
            new Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Padding(
                  child: new Text("Grade ${tournament.grade}"),
                  padding: const EdgeInsets.only(left: 10.0),
                ),
                new Expanded(
                    child: new Padding(
                  child: new Text(
                    "Entrants ${tournament.numberOfEntrants}",
                    textAlign: TextAlign.end,
                  ),
                  padding: const EdgeInsets.only(right: 10.0),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
