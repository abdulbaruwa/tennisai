import 'package:flutter/material.dart';
import '../pages/tournamentSearch.dart';
import '../models/enums.dart' as _enums;

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.redAccent,
);

class SearchTab extends StatefulWidget {
  SearchTab({Key key}) : super(key: key);
  @override
  SearchTabState createState() => new SearchTabState();
}

class SearchTabState extends State<SearchTab> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();

  PersistentBottomSheetController<Null> _bottomSheet;

  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: _kTheme.copyWith(platform: Theme.of(context).platform),
        child: new Scaffold(
            appBar: new AppBar(
              actions: <Widget>[
                new IconButton(
                  icon: const Icon(Icons.more_vert),
                  tooltip: 'Sort by rating',
                  onPressed:
                      _bottomSheet == null ? _showConfigurationSheet : null,
                ),
              ],
              title: new Text(
                'Tournament',
                style: new TextStyle(
                  fontSize: Theme.of(context).platform == TargetPlatform.iOS
                      ? 17.0
                      : 20.0,
                ),
              ),
              elevation:
                  Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
            ),
            key: _scaffoldKey,
            body: new TournamentSearch()));
  }

  void _showConfigurationSheet() {
    final PersistentBottomSheetController<Null> bottomSheet = _scaffoldKey
        .currentState.showBottomSheet((BuildContext bottomSheetContext) {
      return new Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
          border: const Border(top: const BorderSide(color: Colors.black26)),
        ),
        child: new ListView(
          shrinkWrap: true,
          primary: false,
          children: <Widget>[
            new MergeSemantics(
              child: new ListTile(
                dense: true,
                title: const Text('One-line'),
              ),
              
            ),
             new MergeSemantics(
              child: new ListTile(
                dense: true,
                title: const Text('Two-line'),
              ),
              
            ),
              new MergeSemantics(
              child: new ListTile(
                dense: true,
                title: const Text('Three-line'),
              ),
              
            ), ],
        ),
      );
    });

    setState(() {
      _bottomSheet = bottomSheet;
    });

    _bottomSheet.closed.whenComplete(() {
      if (mounted) {
        setState(() {
          _bottomSheet = null;
        });
      }
    });
  }
}
