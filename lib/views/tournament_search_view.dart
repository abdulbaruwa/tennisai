import 'package:flutter/material.dart';
import 'tournament_search.dart';
import '../controls/usercontrols.dart';
import '../models/models.dart';

final List<int> _distancesInMiles = [10, 30, 50, 100, 200, 500];

final List<int> _ageGroups = [12, 14, 16, 18, 100];

final List<int> _grades = [1, 2, 3, 4, 5, 6];

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.redAccent,
);

class TournamentSearchView extends StatefulWidget {
  final List<Tournament> tournaments;
  TournamentSearchView({Key key, this.tournaments}) : super(key: key);
  @override
  SearchTabState createState() => new SearchTabState();
}

class SearchTabState extends State<TournamentSearchView> {
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
            body: new TournamentSearch(tournaments: widget.tournaments)));
  }

  void _showConfigurationSheet() {
    final PersistentBottomSheetController<Null> bottomSheet = _scaffoldKey
        .currentState.showBottomSheet((BuildContext bottomSheetContext) {
      int selectedGender = 0;
      int miles = 30;
      int selectedMiles = 30;
      int selectedGrade = 3;
      int selectedAgeGroup = 18;

      return new Container(
        decoration: const BoxDecoration(
          color: const Color(0xFFE8EAF6),
          //color: const Color(0xFF9FA8DA),
          border: const Border(top: const BorderSide(color: Colors.black26)),
        ),
        child: new ListView(
          shrinkWrap: true,
          primary: false,
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: new Text('Filter options', style: Theme.of(context).textTheme.subhead)
              ),
            new Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: new LabelIntDropDownItem(
                  displayIntItems: _ageGroups,
                  label: 'Age Group',
                  output: selectedAgeGroup,
                  displayFunc: (int i) => i < 100 ? 'U$i' : 'Adult'),
            ),
            // new Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //   child: new LabelIntDropDownItem(
            //       displayIntItems: [0, 1],
            //       label: 'Gender',
            //       output: selectedGender,
            //       displayFunc: (int i) => i == 0 ? 'Female' : 'Male'),
            // ),
            new Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: new LabelIntDropDownItem(
                    displayIntItems: _distancesInMiles,
                    label: 'Distance',
                    output: selectedMiles,
                    displayFunc: (int i) => '$i miles')),
            new Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: new LabelIntDropDownItem(
                    displayIntItems: _grades,
                    label: 'Grade',
                    output: selectedGrade,
                    displayFunc: (int i) => 'Grade $i'))
          ],
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
