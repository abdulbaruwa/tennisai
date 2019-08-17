import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/models.dart';
import '../models/enums.dart' as _enums;
import '../keys/keys.dart';
import '../controls/usercontrols.dart';

typedef OnPlayerProfileSaveCallback = Function(Player player, SearchPreference searchPreference);
typedef OnLocalAvatarImageChangedCallback = Function(File newImage);

final List<int> _distancesInMiles = [10, 30, 50, 100, 200, 500];

final List<int> _ageGroups = [12, 14, 16, 18, 100];

final List<int> _grades = [1, 2, 3, 4, 5, 6];

class ProfileEditView extends StatelessWidget {
  ProfileEditView(
      {Key key,
      this.onSave,
      this.isEditing,
      this.player,
      this.searchPreference,
      this.onChangeImage,
      this.changedAvatar})
      : super(key: key ?? TennisAiKeys.editProfile);

  Future getImage(ImageSource source) async {
    print('Getting image from device');
    var image = await ImagePicker.pickImage(source: source);
    onChangeImage(image);
  }

  final File changedAvatar;
  final bool isEditing;
  final Player player;
  final SearchPreference searchPreference;

  static final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final Function(
          Player player, SearchPreference searchPreference, File changedAvatar)
      onSave;
  final Function(File newImage) onChangeImage;
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
  static final GlobalKey<FormFieldState<String>> _ratingKey =
      new GlobalKey<FormFieldState<String>>();
  static final GlobalKey<FormFieldState<String>> _rankingKey =
      new GlobalKey<FormFieldState<String>>();
  static final GlobalKey _genderKey = new GlobalKey();

  static final genderMap = {'female': 0, 'male': 1};
  static final genderReverseMap = {0: 'Female', 1: 'Male'};

  final ValueChanged<int> onChanged = null;

  void showDemoDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      if (value != null) {
        // _scaffoldKey.currentState.showSnackBar(new SnackBar(
        //   content: new Text('You selected: $value')
        // ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    var genderGroup = new _LabelIntDropDownItem(
        displayIntItems: [0, 1],
        label: 'Gender',
        output: genderMap[searchPreference.gender],
        key: _genderKey,
        displayFunc: (int i) => genderReverseMap[i]);
    var distanceGroup = new _LabelIntDropDownItem(
        displayIntItems: _distancesInMiles,
        label: 'Distance',
        output: searchPreference.distance,
        displayFunc: (int i) => '$i miles');
    var gradeGroup = new _LabelIntDropDownItem(
        displayIntItems: _grades,
        label: 'Grade',
        output: searchPreference.grade,
        displayFunc: (int i) => 'Grade $i');
    var tournamentGroup = new _LabelIntDropDownItem(
        displayIntItems: _ageGroups,
        label: 'Age Group',
        output: searchPreference.ageGroup,
        displayFunc: (int i) => i < 100 ? 'U$i' : 'Adult');
    var _statusDropDown = new _LabelIntDropDownItem(
        displayIntItems: tournamentStatusIndexs,
        label: 'Status',
        output: searchPreference.statusIndex,
        displayFunc: (int i) {
          return tournamentStatus[i].toString();
        });

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
                        address: _addressKey.currentState != null
                            ? _addressKey.currentState.value
                            : player.address,
                        postCode: _postCodeKey.currentState != null
                            ? _postCodeKey.currentState.value
                            : player.postCode,
                        ltaRating: _ratingKey.currentState != null
                            ? _ratingKey.currentState.value
                            : player.ltaRating,
                        ltaRanking: (_rankingKey.currentState.value != null)
                            ? int.parse(_rankingKey.currentState.value)
                            : player.ltaRanking);
                    var updateSearchPreference = new SearchPreference(
                        grade: gradeGroup.output,
                        distance: distanceGroup.output,
                        gender: genderGroup.output,
                        ageGroup: tournamentGroup.output,
                        statusIndex: _statusDropDown.output);
                    onSave(
                        updatedPlayer, updateSearchPreference, changedAvatar);
                    Navigator.pop(context, _enums.DismissDialogAction.save);
                  })
            ]),
            body: new Form(
                child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              children: <Widget>[
                new SizedBox(
                  height: 86.0,
                  child: new Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(left: 5.0),
                      child: new Row(
                        children: <Widget>[
                          new EditableProfileAvatar(
                            playerId: player.id,
                            source: 'userProfile',
                            defaultImage: changedAvatar,
                            onTap: () {
                              showDemoDialog<String>(
                                  context: context,
                                  child: new SimpleDialog(
                                      title:
                                          const Text('Select Profile Picture'),
                                      children: <Widget>[
                                        new SimpleDialogOption(
                                          onPressed: () {
                                            getImage(ImageSource.camera);
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Take a picture'),
                                        ),
                                        new SimpleDialogOption(
                                          onPressed: () {
                                            getImage(ImageSource.gallery);
                                            Navigator.pop(context);
                                          },
                                          child:
                                              const Text('Select from Gallery'),
                                        )
                                      ]));
                            },
                          ),
                          const SizedBox(width: 8.0),
                          new Expanded(
                            child: new Padding(
                                padding: const EdgeInsets.only(
                                    left: 5.0, top: 10.0, right: 15.0),
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
                    fkey: _ratingKey,
                    value: player.ltaRating == null
                        ? ''
                        : player.ltaRating.toString(),
                    inputType: TextInputType.numberWithOptions(decimal: true)),
                new _LabelTextFormEdit(
                    label: 'LTA Ranking',
                    fkey: _rankingKey,
                    value: player.ltaRanking == null ? '' : player.ltaRanking,
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
                  value: player.address == null ? '' : player.address,
                ),
                new _LabelTextFormEdit(
                  label: 'County',
                  fkey: _countryKey,
                  value: player.county,
                  inputType: TextInputType.text,
                ),
                new _LabelTextFormEdit(
                  label: 'Post Code',
                  fkey: _postCodeKey,
                  inputType: TextInputType.text,
                  value: player.postCode == null ? '' : player.postCode,
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
      {Key key,
      this.value,
      this.label,
      this.inputType = TextInputType.text,
      this.fkey})
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
                            keyboardType: this.inputType,
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
                          result = value;
                          widget.output = value;
                        });
                      },
                    ),
                  ),
                )))
      ],
    );
  }
}
