import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/tournament.dart';
import '../models/tournament.dart' as _tournamentModels;
import "package:intl/intl.dart";

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
  primarySwatch: Colors.teal,
  accentColor: Colors.redAccent,
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

class _TournamentGridPageState extends State<TournamentGridPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return new Theme(
        data: _kTheme.copyWith(platform: Theme.of(context).platform),
        child: new Scaffold(
          key: scaffoldKey,
          floatingActionButton: new FloatingActionButton(
            child: const Icon(Icons.edit),
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(const SnackBar(
                content: const Text('Not supported.'),
              ));
            },
          ),
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

void showTournamentDetailsPage(BuildContext context, Tournament recipe) {
  Navigator.push(
      context,
      new MaterialPageRoute<Null>(
        settings: const RouteSettings(name: '/pesto/recipe'),
        builder: (BuildContext context) {
          return new Theme(
            data: _kTheme.copyWith(platform: Theme.of(context).platform),
            //child: new RecipePage(recipe: recipe),
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
    var tournamentDate = "${new DateFormat("yMMMEd").format(tournament.startDate)} to ${ new DateFormat("yMMMEd").format(tournament.endDate)}";
    return new Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new ListTile(
            leading: const Icon(Icons.album),
            title: new Text(tournament.name),
            subtitle: new Text(tournament.location),
          ),
          //new Text(new DateFormat("yMMMEd").format(new DateTime.now())),
          new Text(tournamentDate),
          new Text("Grade 3"),
          new ButtonTheme.bar(
            // make buttons use the appropriate styles for cards
            child: new ButtonBar(
              children: <Widget>[
                new FlatButton(
                  child: new Text('Grade ${tournament.grade}'),
                  onPressed: () {/* ... */},
                ),
                new FlatButton(
                  child: new Text('Entrants (${tournament.numberOfEntrants})'),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // child: new Card(
    //   child: new Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       new Expanded(
    //         child: new Row(
    //           children: <Widget>[
    //             //new Padding(padding: const EdgeInsets.all(16.0),child: new Image.asset("",width: 48.0, height: 48.0,),),
    //             new Expanded(
    //                 child: new Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: <Widget>[
    //                 new Text(tournament.name,
    //                     style: titleStyle,
    //                     softWrap: false,
    //                     overflow: TextOverflow.ellipsis),
    //                 new Text(tournament.grade, style: authorStyle)
    //               ],
    //             ))
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // ),
    // );
  }
}
