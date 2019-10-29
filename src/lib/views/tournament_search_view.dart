import 'package:flutter/material.dart';
import 'package:swagger/api.dart';


import '../models/enums.dart' as _enums;
import '../models/model_mixens.dart';
import 'tournament_search.dart';
import '../controls/usercontrols.dart';

final List<int> _distancesInMiles = [10, 30, 50, 100, 200, 500];

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.redAccent,
);

class TournamentSearchView extends StatefulWidget {
  final List<Tournament> tournaments;
  final Function(SearchPreference) onSearchPreferenceChanged;
  final SearchPreference searchPreference;
  TournamentSearchView(
      {Key key, this.tournaments, this.searchPreference, this.onSearchPreferenceChanged})
      : super(key: key);
  @override
  SearchTabState createState() => new SearchTabState();
}

class SearchTabState extends State<TournamentSearchView> {
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
    LabelIntDropDownItem _distanceInMilesDropDown = new LabelIntDropDownItem(
      onChangedFunc: (int i) => print('Distance from home changed to $i miles'),
      displayIntItems: _distancesInMiles,
      label: 'Distance',
      inputValue: widget.searchPreference.distance,
      displayFunc: (int i) => '$i miles');

    LabelEnumDropDownItem _ageGroupDropDown = new LabelEnumDropDownItem(
      onChangedFunc: (String i) => print('Value Changed to $i'),
      displayIntItems: _enums.AgeGroups,
      label: 'Age Group',
      inputValue: widget.searchPreference.ageGroup,
      displayFunc: (int i) => i < 100 ? 'U$i' : 'Adult');

    LabelIntDropDownItem _gradeDropDown = new LabelIntDropDownItem(
      onChangedFunc: (int i) => print('Grade changed to Grade $i'),
      displayIntItems: _enums.Grades,
      label: 'Grade',
      inputValue: widget.searchPreference.grade,
      displayFunc: (int i) => 'Grade $i');

    LabelEnumDropDownItem _statusDropDown = new LabelEnumDropDownItem(
      displayIntItems: _enums.TournamentStatusTypes,
      label: 'Status',
      inputValue: widget.searchPreference.tournamentStatus,
      displayFunc: (String i)
      {
        return i;
      });

    final PersistentBottomSheetController<Null> bottomSheet = _scaffoldKey
        .currentState.showBottomSheet((BuildContext bottomSheetContext) {
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
            new Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: _statusDropDown),
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
          var searchPref = newSearchPreference(
              ageGroup: _ageGroupDropDown.outputValue ?? widget.searchPreference?.ageGroup,
              grade: _gradeDropDown.outputValue ?? widget.searchPreference?.grade,
              distance: _distanceInMilesDropDown.outputValue ?? widget.searchPreference?.distance,
              gender: widget.searchPreference.gender,
              tournamentStatus: _statusDropDown.outputValue ?? widget.searchPreference?.tournamentStatus);
          widget.onSearchPreferenceChanged(searchPref);
          _bottomSheet = null;
        });
      }
    });
  }
}
