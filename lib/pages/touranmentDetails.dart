import 'package:flutter/material.dart';

import '../models/tournament.dart';

class _TournamentDetails extends StatelessWidget {
  const _TournamentDetails({Key key, this.icon, this.children})
      : super(key: key);

  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final BoxDecoration underlineDecoration = new BoxDecoration(
        border:
            new Border(bottom: new BorderSide(color: themeData.accentColor)));
    return new Container(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: new BoxDecoration(
          border: new Border(
              bottom: new BorderSide(color: themeData.dividerColor))),
      child: new DefaultTextStyle(
        style: Theme.of(context).textTheme.subhead,
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 30.0, right: 0.0),
              width: 31.0,
              child: new Icon(icon, color: themeData.primaryColor),
            ),
            new Expanded(child: new Column(children: children))
          ],
        ),
      ),
    );
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
            width: 31.0,
            child: new Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
          ),
          new Expanded(child: new Text(line))
        ],
      ),
    ));
  }
}

class _HeaderItem extends StatelessWidget {
  _HeaderItem({Key key, this.icon, this.lines, this.tooltip, this.onPressed})
      : assert(lines.length > 0),
        super(key: key);

  final IconData icon;
  final List<String> lines;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final List<Widget> columnChildren = new List<Widget>();
    columnChildren.add(new Text(lines.first, style: themeData.textTheme.title));
    columnChildren.addAll(lines
        .sublist(1, lines.length)
        .map((String line) => new Text(
              line,
              style: themeData.textTheme.subhead,
            ))
        .toList());
    //columnChildren.add(new Text(lines.last, style: themeData.textTheme.subhead));

    final List<Widget> rowChildren = <Widget>[
      new Expanded(
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: columnChildren))
    ];
    if (icon != null) {
      rowChildren.add(new SizedBox(
          width: 72.0,
          child: new IconButton(
              icon: new Icon(icon),
              color: themeData.primaryColor,
              onPressed: onPressed)));
    }
    return new MergeSemantics(
      child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: rowChildren)),
    );
  }
}

class _ContactItem extends StatelessWidget {
  _ContactItem({Key key, this.icon, this.lines, this.tooltip, this.onPressed})
      : assert(lines.length > 0),
        super(key: key);

  final IconData icon;
  final List<String> lines;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final List<Widget> columnChildren = new List<Widget>();
    columnChildren.add(new Text(lines.first, style: themeData.textTheme.title));
    columnChildren.addAll(lines
        .sublist(1, lines.length - 1)
        .map((String line) => new Text(
              line,
              style: themeData.textTheme.subhead,
            ))
        .toList());
    columnChildren.add(new Text(lines.last, style: themeData.textTheme.body1));
    //columnChildren.add(new _IconTextItem(icon: Icons.email, line: 'Hello'));

    final List<Widget> rowChildren = <Widget>[
      new Expanded(
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: columnChildren))
    ];
    if (icon != null) {
      rowChildren.add(new SizedBox(
          width: 72.0,
          child: new IconButton(
              icon: new Icon(icon),
              color: themeData.primaryColor,
              onPressed: onPressed)));
    }
    return new MergeSemantics(
      child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: rowChildren)),
    );
  }
}

class TournamentDetailsPage extends StatefulWidget {
  @override
  TournamentDetailsPageState createState() => new TournamentDetailsPageState();
}

class TournamentDetailsPageState extends State<TournamentDetailsPage> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
  final double _appBarHeight = 256.0;

  @override
  Widget build(BuildContext context) {
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
              expandedHeight: _appBarHeight,
              pinned: true,
              floating: true,
              flexibleSpace: new FlexibleSpaceBar(
                title: const Text('Sutton'),
                background: new Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    new Image.asset(
                      'images/ali_connors.jpeg',
                      fit: BoxFit.cover,
                      height: _appBarHeight,
                    ),

                    // Add this gradient helps make the toolbar icons if any against background image.
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
                new _TournamentDetails(
                  icon: Icons.location_on,
                  children: <Widget>[
                    new _ContactItem(lines: [
                      'Location of Tournaments',''
                    ]),
                    // new _IconTextItem(icon: Icons.email, line: "David.F@mail.com")
                  ],
                ),
                new _IconTextItem(icon: Icons.email, line: "David.F@mail.com",),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class _TournamentItem extends StatelessWidget {
  _TournamentItem(
      {Key key, this.icon, this.lines, this.tooltip, this.onPressed})
      : assert(lines.length > 0),
        super(key: key);

  final IconData icon;
  final List<String> lines;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final List<Widget> columnChildren = lines
        .sublist(0, lines.length - 1)
        .map((String line) => new Text(line))
        .toList();
    columnChildren.add(new Text(
      lines.last,
      style: themeData.textTheme.caption,
    ));
  }
}
