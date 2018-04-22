import 'package:flutter/material.dart';
import '../models/models.dart';
import '../keys/keys.dart';
import '../models/enums.dart' as _enums;
import '../controls/usercontrols.dart';

typedef OnPlayerProfileSaveCallback = Function(
    Player player, SearchPreference searchPreference);
final List<int> _distancesInMiles = [10, 30, 50, 100, 200, 500];

final List<int> _ageGroups = [12, 14, 16, 18, 100];

final List<int> _grades = [1, 2, 3, 4, 5, 6];

class ProfileEditView extends StatelessWidget {
  ProfileEditView(
      {Key key,
      this.onSave,
      this.isEditing,
      this.player,
      this.searchPreference})
      : super(key: key ?? TennisAiKeys.editProfile);

  final bool isEditing;
  final Player player;
  final SearchPreference searchPreference;

  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final Function(Player player, SearchPreference searchPreference) onSave;
  static final GlobalKey<FormFieldState<String>> _firstNameKey =
      new GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> _lastNameKey =
      new GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> _addressKey =
      new GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> _countryKey =
      new GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> _postCodeKey =
      new GlobalKey<FormFieldState<String>>();
  static final GlobalKey _genderKey = new GlobalKey();

  int quantity = 0;
  int selectedGender = 0;
  int miles = 30;
  int selectedMiles = 30;
  int selectedGrade = 3;
  int selectedAgeGroup = 18;

  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    var genderGroup = new _LabelIntDropDownItem(
        displayIntItems: [0, 1],
        label: 'Gender',
        output: selectedGender,
        key: _genderKey,
        displayFunc: (int i) => i == 0 ? 'Female' : 'Male');
    var distanceGroup = new _LabelIntDropDownItem(
        displayIntItems: _distancesInMiles,
        label: 'Distance',
        output: selectedMiles,
        displayFunc: (int i) => '$i miles');
    var gradeGroup = new _LabelIntDropDownItem(
        displayIntItems: _grades,
        label: 'Grade',
        output: selectedGrade,
        displayFunc: (int i) => 'Grade $i');
    var tournamentGroup = new _LabelIntDropDownItem(
        displayIntItems: _ageGroups,
        label: 'Age Group',
        output: selectedAgeGroup,
        displayFunc: (int i) => i < 100 ? 'U$i' : 'Adult');
    var _statusDropDown = new LabelIntDropDownItem(
        onChangedFunc: (int i) => print('Status changed to Grade $i'),
        displayIntItems: tournamentStatusIndexs,
        label: 'Status',
        inputValue: 2,
        displayFunc: (int i)
        {
          return tournamentStatus[i].toString();
        });

    //selectedAgeGroup = tournamentGroup.output;
    return new Theme(
        data: new ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.indigo,
          platform: Theme.of(context).platform,
        ),
        child: new Scaffold(
            // backgroundColor: Colors.white70,
            appBar:
                new AppBar(title: const Text('Edit Profile'), actions: <Widget>[
              new FlatButton(
                  child: new Text('SAVE',
                      style:
                          theme.textTheme.body1.copyWith(color: Colors.white)),
                  onPressed: () {
                    var updatedPlayer = player.copyWith(
                        address: _addressKey.currentState.value,
                        postCode: _postCodeKey.currentState.value);
                    var updateSearchPreference = new SearchPreference(
                        grade: gradeGroup.output,
                        distance: distanceGroup.output,
                        ageGroup: tournamentGroup.output,
                        statusIndex: _statusDropDown.outputValue);
                    onSave(updatedPlayer, updateSearchPreference);
                    Navigator.pop(context, _enums.DismissDialogAction.save);
                  })
            ]),
            body: new Form(
                child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              children: <Widget>[
                new SizedBox(
                  height: 96.0,
                  child: new Container(
                      color: Colors.white,
                      child: new Row(
                        children: <Widget>[
                          new ProfileAvatar(playerId: player.playerId),
                          const SizedBox(width: 8.0),
                          new Expanded(
                            child: new Padding(
                                padding: const EdgeInsets.only(
                                    left: 2.0, top: 10.0, right: 15.0),
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    new TextFormField(
                                      key: _firstNameKey,
                                      initialValue: player.firstName,
                                      decoration: const InputDecoration(
                                          hintText: 'First name *',
                                          isDense: true),
                                      keyboardType: TextInputType.text,
                                    ),
                                    new TextFormField(
                                      key: _lastNameKey,
                                      initialValue: player.lastName,
                                      decoration: const InputDecoration(
                                          hintText: 'Last name *',
                                          isDense: true),
                                      keyboardType: TextInputType.text,
                                    ),
                                  ],
                                )),
                          )
                        ],
                      )),
                ),
                // lta info header
                // FFAFAFA
                new Container(
                    color: const Color(0xFFF5F5F5),
                    padding: const EdgeInsets.all(10.0),
                    child: new Text(
                      'LTA INFO',
                      style: theme.textTheme.caption,
                    )),
                new _LabelTextFormEdit(
                    label: 'LTA Number',
                    value: player.ltaNumber.toString(),
                    inputType: TextInputType.number),
                new _LabelTextFormEdit(
                    label: 'LTA Rating',
                    value: player.ltaRating,
                    inputType: TextInputType.text),
                new _LabelTextFormEdit(
                    label: 'LTA Ranking',
                    value: player.ltaRanking.toString(),
                    inputType: TextInputType.number),
                new Container(
                    color: const Color(0xFFF5F5F5),
                    padding: const EdgeInsets.all(10.0),
                    child: new Text(
                      'ADDRESS',
                      style: theme.textTheme.caption,
                    )),
                new _LabelTextFormEdit(
                  label: 'Street Address',
                  fkey: _addressKey,
                  value: player.address,
                ),
                new _LabelTextFormEdit(
                    label: 'County', fkey: _countryKey, value: player.county),
                new _LabelTextFormEdit(
                  label: 'Post Code',
                  fkey: _postCodeKey,
                  value: player.postCode,
                ),

                new Container(
                    color: const Color(0xFFF5F5F5),
                    padding: const EdgeInsets.all(10.0),
                    child: new Text(
                      'TOURNAMENT SEARCH PREFERENCES',
                      style: theme.textTheme.caption,
                    )),
                new Container(
                    padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                    decoration: _topBottomBoxDecoration,
                    child: new Column(
                      children: <Widget>[
                        genderGroup,
                        distanceGroup,
                        gradeGroup,
                        tournamentGroup,
                        _statusDropDown
                      ],
                    )),
              ],
            ))));
  }
}

final BoxDecoration _topBottomBoxDecoration = new BoxDecoration(
  border: new Border(
    bottom: const BorderSide(color: const Color(0xFFD9D9D9)),
    top: const BorderSide(color: const Color(0xFFD9D9D9)),
  ),
);

class _LabelTextFormEdit extends StatelessWidget {
  final String label;
  final TextInputType inputType;
  final GlobalKey<FormFieldState<String>> fkey;
  final Object value;
  _LabelTextFormEdit(
      {Key key, this.value, this.label, this.inputType, this.fkey})
      : super(key: key);

  Widget build(BuildContext context) {
    return new Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 0.0, left: 10.0),
        child: new Column(
          children: [
            new Row(
              children: <Widget>[
                new Text(label),
                new Expanded(
                    child: new Container(
                        padding: const EdgeInsets.only(right: 5.0, left: 10.0),
                        alignment: Alignment.bottomRight,
                        child: new TextFormField(
                            initialValue: value != null ? value.toString() : '',
                            key: fkey,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.end)))
              ],
            )
          ],
        ));
  }
}

// Used to create a Row with Label and Selectable drop down
class _LabelIntDropDownItem extends StatefulWidget {
  _LabelIntDropDownItem(
      {Key key,
      this.displayFunc,
      this.displayIntItems,
      this.label,
      this.gkey,
      this.output})
      : super(key: key);
  var displayFunc;
  final label;

  final GlobalKey gkey;
  List<int> displayIntItems;
  int output;

  @override
  _LabelIntDropDownItemState createState() => new _LabelIntDropDownItemState();
}

//  State for Row with Label and Selectable drop down
class _LabelIntDropDownItemState extends State<_LabelIntDropDownItem> {
  int result;
  @override
  void initState() {
    super.initState();
    result = widget.output;
  }

  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Text(widget.label),
        new Expanded(
            child: new Container(
                alignment: Alignment.bottomRight,
                child: new DropdownButtonHideUnderline(
                  child: new Container(
                    child: new DropdownButton<int>(
                      items: widget.displayIntItems.map((int value) {
                        return new DropdownMenuItem<int>(
                          value: value,
                          key: widget.gkey,
                          child: new Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: new Text(
                              widget.displayFunc(value),
                              key: widget.gkey,
                            ),
                          ),
                        );
                      }).toList(),
                      value: result,
                      onChanged: (int value) {
                        setState(() {
                          var xx = widget.gkey;
                          print(value);
                          result = value;
                          widget.output = value;
                          print(widget.output);
                        });
                      },
                    ),
                  ),
                )))
      ],
    );
  }
}
