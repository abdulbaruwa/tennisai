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
  final Function(SearchPreference) onSearchPreferenceChanged;
  TournamentSearchView(
      {Key key, this.tournaments, this.onSearchPreferenceChanged})
      : super(key: key);
  @override
  SearchTabState createState() => new SearchTabState();
}

class SearchTabState extends State<TournamentSearchView> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();

  PersistentBottomSheetController<Null> _bottomSheet;
  int _selectedAgeGroup = 18;

  LabelIntDropDownItem _distanceInMilesDropDown = new LabelIntDropDownItem(
      onChangedFunc: (int i) => print('Distance from home changed to $i miles'),
      displayIntItems: _distancesInMiles,
      label: 'Distance',
      inputValue: 30,
      displayFunc: (int i) => '$i miles');

  LabelIntDropDownItem _ageGroupDropDown = new LabelIntDropDownItem(
      onChangedFunc: (int i) => print('Value Changed to $i'),
      displayIntItems: _ageGroups,
      label: 'Age Group',
      inputValue: 16,
      displayFunc: (int i) => i < 100 ? 'U$i' : 'Adult');
  LabelIntDropDownItem _gradeDropDown = new LabelIntDropDownItem(
      onChangedFunc: (int i) => print('Grade changed to Grade $i'),
      displayIntItems: _grades,
      label: 'Grade',
      inputValue: 3,
      displayFunc: (int i) => 'Grade $i');

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
                'Tournaments',
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
                child: new Text('Filter options',
                    style: Theme.of(context).textTheme.subhead)),
            new Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: _ageGroupDropDown,
            ),
            new Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: _distanceInMilesDropDown),
            new Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: _gradeDropDown),
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
          print('Selected Age Group is ${_ageGroupDropDown.outputValue}');
          print('Selected Distance is ${_distanceInMilesDropDown.outputValue}');
          print('Selected Grade is ${_gradeDropDown.outputValue}');
          var searchPref = new SearchPreference(
              ageGroup: _ageGroupDropDown.outputValue,
              grade: _gradeDropDown.outputValue,
              distance: _distanceInMilesDropDown.outputValue);
          widget.onSearchPreferenceChanged(searchPref);
          _bottomSheet = null;
        });
      }
    });
  }
}
