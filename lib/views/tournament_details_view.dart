import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/models.dart';
import '../containers/tournament_entrants.dart';

class TournamentDetailsView extends StatelessWidget {
  final Tournament tournament;
  final TournamentDetailsActionSource source;
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final AnimationController controller; // =  new AnimationController(
  final Function onAddToWatch;
  final Function onAddToBasket;

  static final List<IconData> icons = const [
    Icons.add_shopping_cart,
    Icons.flag
  ];

  // static List<Function> floatActions = new List()..add(onAddToBasket);
  //   onAddToBasket,
  //   onAddToWatch
  // ];
  TournamentDetailsView(
      {Key key,
      this.tournament,
      this.onAddToWatch,
      this.onAddToBasket,
      this.controller,
      this.source})
      : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    final List<Function> floatActions = [this.onAddToBasket, this.onAddToWatch];
    final Color backgroundColor = Theme.of(context).cardColor;
    final Color foregroundColor = Theme.of(context).accentColor;
    Widget floater = new Column(
      mainAxisSize: MainAxisSize.min,
      children: new List.generate(icons.length, (int index) {
        Widget child = new Container(
          height: 60.0,
          width: 56.0,
          alignment: FractionalOffset.topCenter,
          child: new ScaleTransition(
            scale: new CurvedAnimation(
              parent: controller,
              curve: new Interval(0.0, 1.0 - index / icons.length / 2.0,
                  curve: Curves.easeOut),
            ),
            child: new FloatingActionButton(
              backgroundColor: backgroundColor,
              heroTag: icons[index], // Specify herotag - to its icon name: Do this to avoid FloatingActionButton throwing 'Multiple heroes share the same tag exception'
              mini: true,
              child: new Icon(icons[index], color: foregroundColor),
              onPressed: floatActions[index],
            ),
          ),
        );
        return child;
      }).toList()
        ..add(
          new FloatingActionButton(
            heroTag: 'rootFloater',
            child: new AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget child) {
                return new Transform(
                  transform:
                      new Matrix4.rotationZ(controller.value * 0.5 * math.PI),
                  alignment: FractionalOffset.center,
                  child: new Icon(
                      controller.isDismissed ? Icons.share : Icons.close),
                );
              },
            ),
            onPressed: () {
              if (controller.isDismissed) {
                controller.forward();
              } else {
                controller.reverse();
              }
            },
          ),
        ),
    );
    return new Theme(
      data: new ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.indigo,
          platform: Theme.of(context).platform),
      child: new Scaffold(
        key: _scaffoldKey,
        body: new CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              pinned: true,
              floating: false,
              flexibleSpace: new FlexibleSpaceBar(
                title: new Text('${tournament.name}'),
                background: new Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    const DecoratedBox(
                      decoration: const BoxDecoration(
                          gradient: const LinearGradient(
                        begin: const Alignment(0.0, -1.0),
                        end: const Alignment(0.0, -0.4),
                        colors: const <Color>[
                          const Color(0x60000000),
                          const Color(0x0000000)
                        ],
                      )),
                    )
                  ],
                ),
              ),
            ),
            new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
                new _Header(icon: Icons.grade, text: "Tournament Info"),
                new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new _TextItem(text: 'Grade'),
                          new Container(
                            padding:
                                const EdgeInsets.only(left: 30.0, top: 5.0),
                            child: new CircleAvatar(
                                radius: 12.0,
                                child: new Text('${tournament.grade}',
                                    style: Theme
                                        .of(context)
                                        .primaryTextTheme
                                        .body1)),
                          )
                        ],
                      ),
                      new Row(
                        children: <Widget>[
                          new _TextItem(text: 'Entrants'),
                          new Container(
                            padding:
                                const EdgeInsets.only(left: 16.0, top: 5.0),
                            child: new CircleAvatar(
                                radius: 12.0,
                                child: new Text(
                                    '${tournament.numberOfEntrants}',
                                    style: Theme
                                        .of(context)
                                        .primaryTextTheme
                                        .body1)),
                          ),
                          new Expanded(
                              child: new Container(
                                  alignment: Alignment.bottomRight,
                                  //padding: const EdgeInsets.only(top: 10.0),
                                  child: new FlatButton(
                                      textTheme: ButtonTextTheme.accent,
                                      child: new Text('ENTRANTS'),
                                      onPressed: () {
                                        showTournamentEntrantsPage(
                                            context, tournament, source);
                                        // Place holder for event handling
                                      }))),
                        ],
                      ),
                    ]),
                new _Header(icon: Icons.account_balance, text: 'Organiser'),
                new Column(
                  children: <Widget>[
                    new _IconTextItem(
                      icon: Icons.email,
                      line: '${tournament.organiserEmail}',
                    ),
                    new _IconTextItem(
                      icon: Icons.phone,
                      line: '${tournament.organiserPhone}',
                    ),
                  ],
                ),
                // Tournament Location
                new _Header(icon: Icons.location_city, text: 'Location'),
                new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new _TextItem(text: '${tournament.address}'),
                      new _TextItem(text: '${tournament.town}'),
                      new _TextItem(text: '${tournament.postCode}')
                    ]),
                new _Header(
                    icon: Icons.calendar_view_day, text: 'Dates and Times'),
                new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //new _TextItem(text: 'Sat, 21-Mar-2018 - Sun, 22-Mar-2018'),

                      new Container(
                          padding: const EdgeInsets.only(top: 3.0, left: 25.0),
                          child: new RichText(
                            text: new TextSpan(
                                text: '',
                                style: new TextStyle(color: Colors.black),
                                children: <TextSpan>[
                                  new TextSpan(
                                      text: 'Start: ',
                                      style: new TextStyle(fontSize: 14.0)),
                                  new TextSpan(
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold),
                                    text:
                                        '${new DateFormat("yMMMEd").format(tournament.startDate)} - ${ new DateFormat("yMMMEd").format(tournament.endDate)}',
                                  ),
                                ]),
                          )),
                      new Container(
                          padding: const EdgeInsets.only(top: 3.0, left: 25.0),
                          child: new RichText(
                            text: new TextSpan(
                                text: '',
                                style: new TextStyle(color: Colors.black),
                                children: <TextSpan>[
                                  new TextSpan(
                                      text: 'Enter by: ',
                                      style: new TextStyle(fontSize: 14.0)),
                                  new TextSpan(
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold),
                                    text: tournament.entryCloseDate != null
                                        ? '${new DateFormat("yMMMEd").format(tournament.entryCloseDate)}'
                                        : '',
                                  ),
                                ]),
                          )),

                      //new _TextItem(text: 'Entry closes on Mon, 14-Mar-2018'),
                    ]),
                new SizedBox(
                  height: 50.0,
                )
              ]),
            ),
          ],
        ),
        floatingActionButton: floater,
      ),
    );
  }

  void showTournamentEntrantsPage(BuildContext context, Tournament tournament,
      TournamentDetailsActionSource source) {
    Navigator.of(context).push(new MaterialPageRoute(
          builder: (_) =>
              new TournamentEntrants(id: tournament.code, source: source),
        ));
    // Navigator.push(
    //     context,
    //     new MaterialPageRoute<Null>(
    //       settings: const RouteSettings(name: '/tournament/entrants'),
    //       builder: (BuildContext context) {
    //         return new Theme(
    //           data: Theme.of(context),
    //           child: new EntrantsPage(tournament: tournament),
    //         );
    //       },
    //     ));
  }
}

class _Header extends StatelessWidget {
  const _Header({Key key, this.icon, this.text}) : super(key: key);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData themedata = Theme.of(context);
    final Row textRow = new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
            padding: const EdgeInsets.only(top: 30.0, right: 0.0),
            width: 31.0,
            child: new Icon(icon, color: themedata.primaryColor)),
        new Container(
            padding: const EdgeInsets.only(top: 30.0),
            child: new Text(
              text,
              style: themedata.textTheme.title,
            ))
      ],
    );

    final BoxDecoration underlineDecoration = new BoxDecoration(
        border:
            new Border(bottom: new BorderSide(color: themedata.accentColor)));
    return new Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        decoration: underlineDecoration,
        child: new DefaultTextStyle(
            style: themedata.textTheme.subhead, child: textRow));
  }
}

class _IconTextItem extends StatelessWidget {
  _IconTextItem({Key key, this.icon, this.line}) : super(key: key);
  final IconData icon;
  final String line;
  Widget build(BuildContext context) {
    return new Container(
        child: new DefaultTextStyle(
      style: Theme.of(context).textTheme.subhead,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(left: 29.0, top: 5.0),
            width: 30.0,
            child: new Icon(
              icon,
              size: 14.0,
              color: Theme.of(context).primaryColor,
            ),
          ),
          new Container(
              padding: const EdgeInsets.only(top: 3.0, left: 25.0),
              child: new Text(line)),
        ],
      ),
    ));
  }
}

class _TextItem extends StatelessWidget {
  const _TextItem({Key key, this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: const EdgeInsets.only(top: 3.0, left: 25.0),
        child: new Text(text));
  }
}